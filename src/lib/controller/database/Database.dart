import 'package:confnect/model/Forum.dart';
import 'package:confnect/model/Post.dart';

import '../../model/User.dart';

abstract class Database {
  String getAppName();
  List<User> getUsers();
  List<Forum> getForums();
  Forum getForum(int id);
  List<Post> getForumPosts(int forumId);
  bool login(String username, String password);
  int register(String fullname, String username, String password);
  void addPost(int forumId, String username, String title, String text);
}
