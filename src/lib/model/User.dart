import 'Tag.dart';
import 'forums/Forum.dart';
import 'forums/TagForum.dart';

class User {
  final int id;
  final String _fullname, _username, _password, _role;
  String _avatarUrl;
  List<Forum> _forums = new List();
  List<Tag> _tags = new List();
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

  List<Forum> getForums() {
    return _forums;
  }

  void addForum(Forum forum) {
    if(!this._forums.contains(forum)) {
      this._forums.add(forum);
      /*forum.getTags().forEach((tag) {
        !this._tags.contains(tag) ?? this._tags.add(tag);
      });*/
      print("User Tags: " + forum.getTags().toString());
      this._tags.addAll(forum.getTags());
    }
  }

  List<Tag> getTags() {
    return _tags;
  }

  bool auth(String username, String password) {
    return this._username == username && this._password == password;
  }
}
