import 'Conference.dart';
import 'Tag.dart';
import 'forums/Forum.dart';

class User {
  final int id;
  String _fullname, _username, _avatarUrl, _bio;
  final String _password;
  Map<Conference, String> _roles = Map();
  Map<Conference, List<int>> _userTalkForumIds;
  List<int> _userTagForumIds;
  List<Forum> _forums = new List();
  List<Tag> _tags = new List();

  User(this.id, this._fullname, this._username, this._password,
      this._userTalkForumIds,
      [this._roles,
      this._avatarUrl,
      this._bio = "",
      this._userTagForumIds = const []]);

  String getUsername() => _username;

  String getFullName() => _fullname;

  String getRole(Conference conference) => _roles[conference];

  Map<Conference, String> getRoles() => _roles;

  Map<Conference, List<int>> getUserTalkForumIds() => _userTalkForumIds;

  String getAvatarUrl() => _avatarUrl;

  String getBio() => _bio;

  void setTalkForumsIds(List<int> forums) {
    _userTagForumIds = forums;
  }

  @override
  String toString() => _fullname;

  List<int> getUserForumsIds(Conference conference) {
    List<int> out = [];
    out.addAll(_userTagForumIds);
    out.addAll(_userTalkForumIds[conference]);
    return out;
  }

  bool isInConference(Conference conference) {
    return _roles.containsKey(conference);
  }

  void setAvatarUrl(String avatarUrl) {
    this._avatarUrl = avatarUrl;
  }

  void setFullName(String fullname) {
    this._fullname = fullname;
  }

  void setUserName(String username) {
    this._username = username;
  }

  void setBio(String bio) {
    this._bio = bio;
  }

  void addRole(Conference conference, String role) {
    _roles[conference] = role;
  }

  List<Forum> getForums() {
    return _forums;
  }

  void addForum(Forum forum) {
    if (!this._forums.contains(forum)) {
      this._forums.add(forum);
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
