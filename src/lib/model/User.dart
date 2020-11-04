class User {
  final String _username;
  final String _password;
  User(this._username, this._password);

  String getUsername() {
    return _username;
  }

  String getPassword() {
    return _password;
  }

  static bool auth(User user1, User user2) {
    return user1.getUsername() == user2.getUsername() &&
        user1.getPassword() == user2.getPassword();
  }
}
