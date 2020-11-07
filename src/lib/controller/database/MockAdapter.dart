import 'package:confnect/model/Forum.dart';
import 'package:confnect/model/Post.dart';

import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  static List<User> _users = [
    User(0, "test", "123",
        "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=231081"),
    User(1, "trump", "1",
        "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg"),
  ];

  static List<Forum> _forums = [
    Forum(_users[0], "Data science", "lorem ipsum"),
    Forum(_users[1], "Mobile Development", "zaszaszazsa"),
  ];

  static List<Post> _posts = [
    Post(_users[0], "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra"),
    Post(_users[1], "It deserves a 20!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra le"),
    Post(_users[0], "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli"),
  ];

  String getAppName() {
    return "Confnect";
  }

  bool login(String username, String password) {
    List<User> users = this.getUsers();
    bool res = false;
    int id = 0;
    users.forEach((element) {
      id++;
      if (User.auth(element, new User(id, username, password))) res = true;
    });
    return res;
  }

  int register(String fullname, String username, String password) {
    int id = _users.length;
    if (fullname.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      for (var user in _users) {
        if (user.getUsername() == username) {
          print("Return");
          return 2;
        }
      }

      _users.add(User(id, username, password));
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
