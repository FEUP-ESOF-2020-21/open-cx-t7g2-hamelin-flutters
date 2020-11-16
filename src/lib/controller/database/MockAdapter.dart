import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Forum.dart';
import 'package:confnect/model/Post.dart';

import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  static List<User> _users = [
    User(0, "test", "123",
        "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=231081"),
    User(1, "trump", "1",
        "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg"),
    User(2, "Obama", "1",
        "https://i.kym-cdn.com/entries/icons/facebook/000/030/329/cover1.jpg"),
    User(3, "QUIM", "1",
        "https://thumbs.web.sapo.io/?W=1630&H=0&crop=center&delay_optim=1&epic=Y2JkMZRgjDe+oe0kRpgdEAigzldn9mL/x79Ak4FayV8oDSPK+OknuH6kbzY+lV16HvfdDjiG832j1TBGUosBMJYVapZOCXrImloUP1vTeiBTp+U="),
    User(4, "Souto", "1",
        "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=238172"),
    User(5, "Augusto Souza", "1",
        "https://i.ytimg.com/vi/exEdW9vo1SM/maxresdefault.jpg"),
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
    Forum(
      2,
      "Blockchain",
      "Some fancy slogan.",
      "https://i0.wp.com/www.cienciaedados.com/wp-content/uploads/2018/01/Big-Data-e-as-Oportunidades-com-Blockchain.jpg?fit=765%2C457",
    ),
    Forum(
      3,
      "Internet of Things",
      "Some fancy slogan.",
      "https://130e178e8f8ba617604b-8aedd782b7d22cfe0d1146da69a52436.ssl.cf1.rackcdn.com/gao-assesses-iot-cybersecurity-other-risks-showcase_image-6-a-9926.jpg",
    ),
    Forum(
      5,
      "Competetive Programming",
      "Some fancy slogan.",
      "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20191004160106/How-to-Prepare-for-Competitive-Programming.png",
    ),
    Forum(
      5,
      "Capture the Flag",
      "Some fancy slogan.",
      "https://embeddedworldhome.files.wordpress.com/2019/05/icons_ctf_1.png?w=1250",
    ),
    Forum(
      6,
      "Machine Learning",
      "Some fancy slogan.",
      "https://dvlsystems.com/wp-content/uploads/2020/08/machine_learning.jpg",
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
        _users[0],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        _comments),
    Post(
        0,
        _users[1],
        "It deserves a 20!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(0, _users[2], "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli", _comments),
    Post(
        0,
        _users[3],
        "Make America Great Again!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        0,
        _users[4],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        0,
        _users[5],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        1,
        _users[1],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        _comments),
    Post(
        1,
        _users[2],
        "It deserves a 21!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(1, _users[3], "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli", _comments),
    Post(
        1,
        _users[4],
        "Make America Great Again!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        1,
        _users[5],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        1,
        _users[1],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        2,
        _users[2],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        _comments),
    Post(
        2,
        _users[3],
        "It deserves a 22!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(2, _users[4], "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli", _comments),
    Post(
        3,
        _users[5],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        _comments),
    Post(
        3,
        _users[1],
        "It deserves a 23!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(3, _users[2], "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli", _comments),
    Post(
        3,
        _users[3],
        "Make America Great Again!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        4,
        _users[4],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
    Post(
        4,
        _users[5],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        _comments),
  ];

  String getAppName() {
    return "Confnect";
  }

  bool login(String username, String password) {
    List<User> users = this.getUsers();
    bool res = false;
    int id = 0;
    users.forEach((element) {
      id++;
      if (User.auth(element, new User(id, username, password))) res = true;
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

      _users.add(User(id, username, password));
      print("Register success");
      return 1;
    }
    print("Register failed");
    return 0;
  }

  void addPost(String username, String title, String text) {
    for (var user in _users)
      if (user.getUsername() == username)
        _posts.add(Post(1, user, title, text, List<Comment>()));
  }

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
