import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Forum.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/Talk.dart';

import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  static List<User> _users = [
    User(0, UserRole.ADMIN, "Test User", "test", "123",
        "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=231081"),
    User(1, UserRole.ATTENDEE, "Donald Trump", "trump", "1",
        "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg"),
    User(2, UserRole.HOST, "Lew Lee", "fanatic", "1",
        "http://031c074.netsolhost.com/WordPress/wp-content/uploads/2014/12/conspiracy-theory.jpg"),
  ];

  static List<Forum> _forums = [
    Forum(
      0,
      "Data science",
      "This is the best forum about Data Science you'll ever encounter!",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fblog.learningtree.com%2Fwp-content%2Fuploads%2F2018%2F07%2Fdatasci.jpg&f=1&nofb=1",
    ),
    Forum(
      1,
      "Mobile Development",
      "We are all Hamelin Flutters here.",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fckab.b-cdn.net%2Fwp-content%2Fuploads%2F2019%2F07%2FMobile-App-Development-Frameworks.png&f=1&nofb=1",
    ),
  ];
  static List<Comment> _comments = [
    Comment(
        _users[0],
        new Date(new DateTime.now().subtract(Duration(minutes: 10))),
        "Melhor comentário de sempre"),
    Comment(
        _users[1],
        new Date(new DateTime.now().subtract(Duration(minutes: 5))),
        "Pior comentário de sempre"),
    Comment(_users[1], new Date(new DateTime.now()),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu massa feugiat, bibendum erat vitae, sollicitudin nibh."),
  ];

  static List<Post> _posts = [
    Post(
      0,
      _users[0],
      "Flutter master",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
      _comments,
    ),
    Post(
      0,
      _users[1],
      "It deserves a 20!",
      "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
      _comments,
    ),
    Post(
      1,
      _users[0],
      "Welcome!",
      "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
      _comments,
    ),
  ];

  static List<Tag> _tags = [
    Tag(0, "AI"),
    Tag(1, "Robotics"),
    Tag(2, "Conspiracy Theories"),
  ];

  static List<Talk> _talks = [
    Talk(
      "The rise of robots",
      "In this talk, we'll discuss the rise of robots and what it means for our survival",
      _users[2],
      "https://s3.amazonaws.com/media.eremedia.com/wp-content/uploads/2018/02/12141454/AI-robot-future-tech-trends.jpg",
      [_tags[0], _tags[1], _tags[2]],
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

  int register(String fullname, String username, String password) {
    int id = _users.length;
    if (fullname.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      for (var user in _users) {
        if (user.getUsername() == username) {
          print("Return");
          return 2;
        }
      }

      _users.add(User(id, UserRole.ATTENDEE, fullname, username, password));
      print("Register success");
      return 1;
    }
    print("Register failed");
    return 0;
  }

  User getUser(String username) {
    return _users.firstWhere((element) => element.getUsername() == username);
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
