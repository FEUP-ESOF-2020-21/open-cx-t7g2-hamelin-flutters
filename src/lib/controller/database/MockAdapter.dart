import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
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
    return [
      User("rafaavc", "password"),
      User("test", "password"),
    ];
  }
}
