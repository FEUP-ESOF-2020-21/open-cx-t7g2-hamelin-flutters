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
  User getUser(String username);
  List<Tag> getTags();
  List<Talk> getTalks();
}
