import 'package:confnect/controller/database/Database.dart';
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

  List<Forum> searchForums(String key) {
    List<Forum> forums = _database.getForums();
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

  List<User> searchUsers(String key) {
    List<User> users = _database.getUsers();
    Map<User, double> usersMap = {};
    final invalidUsers = [];
    for (final user in users) {
      if (user.getRole() != UserRole.ATTENDEE &&
          user.getRole() != UserRole.HOST) {
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

  List<Post> searchPosts(String key) {
    List<Post> posts = _database.getPosts();
    Map<Post, double> postsMap = {};
    for (final post in posts) {
      postsMap[post] = calculateResemblance(key, _database.getForum(post.getForumId()).getTitle()) + calculateResemblance(key, post.getTitle()) +
          0.7 * calculateResemblance(key, post.getDescription()) +
          calculateResemblance(key, post.getAuthor().getFullName());
    }

    posts.sort((Post p1, Post p2) {
      return postsMap[p2].compareTo(postsMap[p1]);
    });
    return posts;
  }

  SearchResult search(String key) {
    List<Forum> forums = searchForums(key);
    List<User> users = searchUsers(key);
    List<Post> posts = searchPosts(key);

    return SearchResult(forums, users, posts);
  }
}
