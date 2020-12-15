import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Conference.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/SearchResult.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:string_similarity/string_similarity.dart';

class SearchController {
  final Database _database;
  SearchController(Database this._database);

  double calculateResemblance(String key, String value) {
    return value.similarityTo(key);
  }

  List<Forum> searchForums(Conference conference, String key) {
    List<Forum> forums = _database.getForums(conference);
    Map<Forum, double> forumMap = {};
    for (final forum in forums) {
      forumMap[forum] = calculateResemblance(key, forum.getTitle()) +
          (forum.getSpeaker() == null
              ? 0
              : calculateResemblance(key, forum.getSpeaker().getFullName())) +
          0.7 * calculateResemblance(key, forum.getDescription());
    }

    forums.sort((Forum f1, Forum f2) {
      return forumMap[f2].compareTo(forumMap[f1]);
    });
    return forums;
  }

  List<User> searchUsers(Conference conference, String key) {
    List<User> users = _database.getUsers();
    Map<User, double> usersMap = {};
    final invalidUsers = [];
    for (final user in users) {
      if (user.getRole(conference) != UserRole.ATTENDEE &&
          user.getRole(conference) != UserRole.HOST) {
        invalidUsers.add(user);
        continue;
      }
      usersMap[user] = calculateResemblance(key, user.getUsername()) +
          calculateResemblance(key, user.getFullName());
    }

    invalidUsers.forEach((element) {
      users.remove(element);
    });

    users.sort((User u1, User u2) {
      return usersMap[u2].compareTo(usersMap[u1]);
    });
    return users;
  }

  List<Post> searchPosts(Conference conference, String key) {
    List<Post> posts = _database.getPosts(conference);
    Map<Post, double> postsMap = {};
    for (final post in posts) {
      postsMap[post] = calculateResemblance(key, post.getTitle()) +
          0.7 * calculateResemblance(key, post.getDescription()) +
          calculateResemblance(key, post.getAuthor().getFullName());
    }

    posts.sort((Post p1, Post p2) {
      return postsMap[p2].compareTo(postsMap[p1]);
    });
    return posts;
  }

  SearchResult search(Conference conference, String key) {
    List<Forum> forums = searchForums(conference, key);
    List<User> users = searchUsers(conference, key);
    List<Post> posts = searchPosts(conference, key);

    return SearchResult(forums, users, posts);
  }
}
