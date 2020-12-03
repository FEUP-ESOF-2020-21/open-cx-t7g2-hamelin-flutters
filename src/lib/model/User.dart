class User {
  final int id;
  final String _fullname, _username, _password, _role;
  String _avatarUrl;
  String _bio;
  User(this.id, this._role, this._fullname, this._username, this._password,
      [this._avatarUrl, this._bio = ""]);

  String getUsername() {
    return _username;
  }

  String getFullName() => _fullname;

  String getRole() => _role;

  String getAvatarUrl() {
    return _avatarUrl;
  }

  String getBio() {
    return _bio;
  }

  void setAvatarUrl(String avatarUrl) {
    this._avatarUrl = avatarUrl;
  }

  bool auth(String username, String password) {
    return this._username == username && this._password == password;
  }
}
