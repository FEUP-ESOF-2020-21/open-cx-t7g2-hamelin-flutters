class User {
  final int id;
  String _fullname, _username, _avatarUrl, _bio;
  final String _password, _role;
  List<int> _userForunsIds;

  User(this.id, this._role, this._fullname, this._username, this._password,
      [this._avatarUrl, this._bio = "", this._userForunsIds = const []]);

  String getUsername() => _username;

  String getFullName() => _fullname;

  String getRole() => _role;

  String getAvatarUrl() => _avatarUrl;

  String getBio() => _bio;

  List<int> getUserForunsIds() => _userForunsIds;

  void setAvatarUrl(String avatarUrl) {
    this._avatarUrl = avatarUrl;
  }

  void setFullName(String fullname) {
    this._fullname = fullname;
  }

  void setUserName(String username) {
    this._username = username;
  }

  bool auth(String username, String password) {
    return this._username == username && this._password == password;
  }
}
