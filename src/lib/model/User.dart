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
  String backgroundPicUrl = "https://imgur.com/F4uRSQV.png";

  User(this.id, this._fullname, this._username, this._password,
      [this._roles,
      this._avatarUrl,
      this._bio = "",
      this._userTalkForumIds = const {},
      this._userTagForumIds = const []]);

  String getUsername() => _username;

  String getFullName() => _fullname;

  String getFirstName() {
    return _getFirstWords(_fullname, 1);
  }

  String _getFirstWords(String sentence, int wordCounts) {
    return sentence.split(" ").sublist(0, wordCounts).join(" ");
  }

  String getRole(Conference conference) => _roles[conference];

  String getAvatarUrl() => _avatarUrl;

  String getBio() => _bio;

  String getBackgroundPicUrl() => backgroundPicUrl;

  @override
  String toString() => _fullname;

  List<int> getUserForunsIds(Conference conference) {
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

  void setBackgroundPicUrl(String backgroundPicUrl) {
    this.backgroundPicUrl = backgroundPicUrl;
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
