import 'package:confnect/model/Forum.dart';
import 'package:confnect/model/Post.dart';

import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  static List<User> _users = [
    User("test", "123",
        "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=231081"),
  ];

  static List<Forum> _forums = [
    Forum(_users[0], "Flutter master", "lorem ipsum"),
    Forum(_users[0], "password", "zaszaszazsa"),
  ];

  static List<Post> _posts = [
    Post(_users[0], "Flutter master", "lorem ipsum"),
    Post(_users[0], "password", "zaszaszazsa"),
  ];

  String getAppName() {
    return "Confnect";
  }

  bool login(String username, String password) {
    List<User> users = this.getUsers();
    bool res = false;
    users.forEach((element) {
      if (User.auth(element, new User(username, password))) res = true;
    });
    return res;
  }

  int register(String fullname, String username, String password) {
    if (fullname.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      for (var user in _users) {
        if (user.getUsername() == username) {
          print("Return");
          return 2;
        }
      }

      _users.add(User(username, password));
      print("Register success");
      return 1;
    }
    print("Register failed");
    return 0;
  }

  List<User> getUsers() {
    return _users;
  }

  static List<Forum> getForums() {
    return _forums;
  }

  static List<Post> getPosts() {
    return _posts;
  }
}
