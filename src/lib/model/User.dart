class User {
  final int id;
  final String _fullname, _username, _password, _role;
  String _avatarUrl;
  User(this.id, this._role, this._fullname, this._username, this._password,
      [this._avatarUrl]);

  String getUsername() {
    return _username;
  }

  String getFullName() => _fullname;

  String getRole() => _role;

  String getAvatarUrl() {
    return _avatarUrl;
  }

  void setAvatarUrl(String avatarUrl) {
    this._avatarUrl = avatarUrl;
  }

  bool auth(String username, String password) {
    return this._username == username && this._password == password;
  }
}
