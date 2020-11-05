import '../../model/User.dart';

abstract class Database {
  String getAppName();
  List<User> getUsers();
  bool login(String username, String password);
  int register(String fullname, String username, String password);
}
