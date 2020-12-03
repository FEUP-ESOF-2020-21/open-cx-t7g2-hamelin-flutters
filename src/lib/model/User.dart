class User {
  final int id;
  final String _fullname, _username, _password, _role;
  String _avatarUrl;
  String _bio;
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

  bool auth(String username, String password) {
    return this._username == username && this._password == password;
  }
}
