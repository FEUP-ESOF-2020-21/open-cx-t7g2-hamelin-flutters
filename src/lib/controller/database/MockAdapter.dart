import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  List<User> users = [];

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
      for (var user in users) {
        if (user.getUsername() == username) {
          print("Return");
          return 2;
        }
      }

      users.add(User(username, password));
      print("Register success");
      return 1;
    }
    print("Register failed");
    return 0;
  }

  List<User> getUsers() {
    return users;
  }
}
