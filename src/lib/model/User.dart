class User {
  final int id;
  final String _username;
  final String _password;
  String _avatarUrl;
  User(this.id, this._username, this._password, [this._avatarUrl]);

  String getUsername() {
    return _username;
  }

  String getPassword() {
    return _password;
  }

  String getAvatarUrl() {
    return _avatarUrl;
  }

  void setAvatarUrl(String avatarUrl) {
    this._avatarUrl = avatarUrl;
  }

  static bool auth(User user1, User user2) {
    return user1.getUsername() == user2.getUsername() &&
        user1.getPassword() == user2.getPassword();
  }
}
