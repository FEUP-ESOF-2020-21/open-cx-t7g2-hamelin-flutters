import 'package:confnect/model/Forum.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/Talk.dart';

import '../../model/User.dart';

class UserRole {
  static const ADMIN = 'admin';
  static const HOST = 'host';
  static const ATTENDEE = 'attendee';
}

abstract class Database {
  String getAppName();
  List<User> getUsers();
  List<Forum> getForums();
  Forum getForum(int id);
  List<Post> getForumPosts(int forumId);
  bool login(String username, String password);
  int register(String fullname, String username, String password);
  void addPost(int forumId, String username, String title, String text);
  User getUser(String username);
  List<Tag> getTags();
  List<Talk> getTalks();
  bool existsUser(String username);
  bool hasRole(String username, String role);
  void addTalk(String title, String description, String speaker, String image,
      List<Tag> tags);
  Tag createTag(String name);
  void addTag(Tag tag);
  void deleteTalk(Talk talk);
}
