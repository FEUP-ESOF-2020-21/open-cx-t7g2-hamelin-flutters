import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/Talk.dart';
import 'package:confnect/model/forums/TagForum.dart';
import 'package:confnect/model/forums/TalkForum.dart';

import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  static List<User> _users = [
    User(0, UserRole.ADMIN, "Test User", "test", "123",
        "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=231081"),
    User(1, UserRole.ATTENDEE, "Donald Trump", "trump", "1",
        "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg"),
    User(
        2,
        UserRole.ATTENDEE,
        "Obama",
        "obama",
        "1",
        "https://i.kym-cdn.com/entries/icons/facebook/000/030/329/cover1.jpg",
        "Obama bio baby!",
        [0, 1]),
    User(3, UserRole.ATTENDEE, "QUIM", "quim", "1",
        "https://thumbs.web.sapo.io/?W=1630&H=0&crop=center&delay_optim=1&epic=Y2JkMZRgjDe+oe0kRpgdEAigzldn9mL/x79Ak4FayV8oDSPK+OknuH6kbzY+lV16HvfdDjiG832j1TBGUosBMJYVapZOCXrImloUP1vTeiBTp+U="),
    User(4, UserRole.ATTENDEE, "Souto", "souto", "1",
        "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=238172"),
    User(5, UserRole.ATTENDEE, "Augusto Sousa", "aas", "1",
        "https://i.ytimg.com/vi/exEdW9vo1SM/maxresdefault.jpg"),
    User(6, UserRole.HOST, "Lew Lee", "fanatic", "1",
        "http://031c074.netsolhost.com/WordPress/wp-content/uploads/2014/12/conspiracy-theory.jpg"),
  ];

  static List<Forum> _forums = [
    TalkForum(0, _talks[0]),
    TalkForum(8, _talks[1]),
    TagForum(1, _tags[0]),
    TagForum(2, _tags[1]),
    TagForum(3, _tags[2]),
    TagForum(4, _tags[3]),
    TagForum(5, _tags[4]),
    TagForum(6, _tags[5]),
    TagForum(7, _tags[6]),
  ];
  static List<Comment> _comments = [
    Comment(
        _users[2],
        new Date(new DateTime.now().subtract(Duration(minutes: 10))),
        "Melhor comentário de sempre"),
    Comment(
        _users[1],
        new Date(new DateTime.now().subtract(Duration(minutes: 5))),
        "Pior comentário de sempre"),
    Comment(
        _users[2],
        new Date(new DateTime.now().subtract(Duration(minutes: 5))),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sagittis orci non eros mattis pretium. Fusce et felis et sem efficitur ullamcorper consequat id lacus."),
    Comment(
        _users[3],
        new Date(new DateTime.now().subtract(Duration(minutes: 5))),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sagittis orci non eros mattis pretium. Fusce et felis et sem efficitur ullamcorper consequat id lacus."),
    Comment(
        _users[4],
        new Date(new DateTime.now().subtract(Duration(minutes: 5))),
        "Pior comentário de sempre"),
    Comment(_users[5], new Date(new DateTime.now()),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu massa feugiat, bibendum erat vitae, sollicitudin nibh."),
  ];

  static List<Post> _posts = [
    Post(
      0,
      _users[3],
      "Flutter master",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      [_comments[0], _comments[1]],
    ),
    Post(
      0,
      _users[1],
      "It deserves a 20!",
      "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      [_comments[2]],
    ),
    Post(
      0,
      _users[2],
      "Welcome!",
      "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      [_comments[3], _comments[4]],
    ),
    Post(
      0,
      _users[3],
      "Make America Great Again!",
      "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      [_comments[5]],
    ),
    Post(
        0,
        _users[4],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        0,
        _users[5],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        1,
        _users[1],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        1,
        _users[2],
        "It deserves a 21!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        1,
        _users[3],
        "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        1,
        _users[4],
        "Make America Great Again!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        1,
        _users[5],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        1,
        _users[1],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        2,
        _users[2],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        2,
        _users[3],
        "It deserves a 22!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        2,
        _users[4],
        "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        3,
        _users[5],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        3,
        _users[1],
        "It deserves a 23!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        3,
        _users[2],
        "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
        3,
        _users[3],
        "Make America Great Again!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
    Post(
      4,
      _users[4],
      "Confnect is the greatest!",
      "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
    ),
    Post(
        4,
        _users[5],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))), []),
  ];

  static List<Tag> _tags = [
    Tag(
      0,
      "Data science",
      "This is the best forum about Data Science you'll ever encounter!",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fblog.learningtree.com%2Fwp-content%2Fuploads%2F2018%2F07%2Fdatasci.jpg&f=1&nofb=1",
    ),
    Tag(
      1,
      "Mobile Development",
      "We are all Hamelin Flutters here.",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fckab.b-cdn.net%2Fwp-content%2Fuploads%2F2019%2F07%2FMobile-App-Development-Frameworks.png&f=1&nofb=1",
    ),
    Tag(
      2,
      "Blockchain",
      "Some fancy slogan.",
      "https://i0.wp.com/www.cienciaedados.com/wp-content/uploads/2018/01/Big-Data-e-as-Oportunidades-com-Blockchain.jpg?fit=765%2C457",
    ),
    Tag(
      3,
      "Internet of Things",
      "Some fancy slogan.",
      "https://130e178e8f8ba617604b-8aedd782b7d22cfe0d1146da69a52436.ssl.cf1.rackcdn.com/gao-assesses-iot-cybersecurity-other-risks-showcase_image-6-a-9926.jpg",
    ),
    Tag(
      5,
      "Competitive Programming",
      "Some fancy slogan.",
      "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20191004160106/How-to-Prepare-for-Competitive-Programming.png",
    ),
    Tag(
      5,
      "Capture the Flag",
      "Some fancy slogan.",
      "https://embeddedworldhome.files.wordpress.com/2019/05/icons_ctf_1.png?w=1250",
    ),
    Tag(
      6,
      "Machine Learning",
      "Some fancy slogan.",
      "https://dvlsystems.com/wp-content/uploads/2020/08/machine_learning.jpg",
    ),
  ];

  static List<Talk> _talks = [
    Talk(
      0,
      "The rise of robots",
      "In this talk, we'll discuss the rise of robots and what it means for our survival as a species.",
      _users[6],
      "https://s3.amazonaws.com/media.eremedia.com/wp-content/uploads/2018/02/12141454/AI-robot-future-tech-trends.jpg",
      [_tags[0], _tags[1], _tags[2]],
    ),
    Talk(
      1,
      "Qubits: Quantum bits",
      "A talk about quantum computers, their origin, their current state, and predicitons for the future.",
      _users[6],
      "https://i0.wp.com/indusdictum.com/wp-content/uploads/2020/03/Indian-scientists-from-RRI-scientists-devise-test-for-fairness-of-qubits-in-quantum-computers.png",
      [_tags[3]],
    ),
  ];

  String getAppName() {
    return "Confnect";
  }

  bool login(String username, String password) {
    List<User> users = this.getUsers();
    bool res = false;
    users.forEach((element) {
      if (element.auth(username, password)) res = true;
    });
    return res;
  }

  void register(
      String fullname, String username, String password, String profilePicUrl) {
    if (profilePicUrl.length == 0)
      profilePicUrl =
          "http://cdn.patch.com/assets/layout/contribute/user-default.png";
    int id = _users.length;
    _users.add(User(
        id, UserRole.ATTENDEE, fullname, username, password, profilePicUrl));
  }

  void addPost(
      int forumId, String username, String title, String text, Date date) {
    for (var user in _users)
      if (user.getUsername() == username)
        _posts.add(Post(forumId, user, title, text, date, List<Comment>()));
  }

  void createTalkForum(Talk talk) {
    _forums.add(TalkForum(_forums.length, talk));
  }

  void createTagForum(Tag tag) {
    _forums.add(TagForum(_forums.length, tag));
  }

  void addTag(Tag tag) {
    _tags.add(tag);
    createTagForum(tag);
    print('''Added tag "${tag.getName()}" in db''');
  }

  void addTalk(String title, String description, String speaker, String image,
      List<Tag> tags) {
    tags.forEach((tag) {
      if (!_tags.contains(tag)) {
        addTag(tag);
      }
    });
    Talk talk =
        Talk(_talks.length, title, description, getUser(speaker), image, tags);
    _talks.add(talk);
    createTalkForum(talk);
  }

  bool isTagNew(Tag tag) {
    return !_tags.contains(tag);
  }

  void editTalk(int talkId, String title, String description, String speaker,
      String image, List<Tag> tags) {
    tags.forEach((tag) {
      if (!_tags.contains(tag)) {
        addTag(tag);
      }
    });
    Talk talk = _talks.firstWhere((talk) => talk.getId() == talkId);
    talk.setTitle(title);
    talk.setDescription(description);
    talk.setSpeaker(getUser(speaker));
    talk.setImageURL(image);
    talk.setTags(tags);
  }

  void deleteTalk(Talk talk) {
    _talks.remove(talk);
  }

  Tag createTag(String name) {
    return Tag(_tags.length, name, null, null);
  }

  User getUser(String username) {
    return _users.firstWhere(
      (element) => element.getUsername() == username,
      orElse: () => null,
    );
  }

  bool existsUser(String username) {
    print(getUser(username));
    return getUser(username) != null;
  }

  bool hasRole(String username, String role) {
    User user = getUser(username);
    if (user == null) return false;
    if (user.getRole() == role) return true;
    return false;
  }

  List<Tag> getTags() => _tags;

  List<Talk> getTalks() => _talks;

  List<User> getUsers() {
    return _users;
  }

  List<Forum> getForums() {
    return _forums;
  }

  Forum getForum(int id) {
    return _forums.firstWhere((element) => element.getId() == id);
  }

  List<Post> getForumPosts(int forumId) {
    return _posts.where((element) => element.getForumId() == forumId).toList();
  }
}
