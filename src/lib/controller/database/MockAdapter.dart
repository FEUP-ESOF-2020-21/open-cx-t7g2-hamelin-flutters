import 'package:confnect/model/Forum.dart';

import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  static List<User> users = [
    User("rafaavc", "password"),
    User("test", "password"),
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

  List<User> getUsers() {
    return users;
  }

  static List<Forum> getForums() {
    return [
      Forum(users[0], "Flutter master", "lorem ipsum"),
      Forum(users[1], "password", "zaszaszazsa"),
    ];
  }
}
