import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Conference.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/Talk.dart';
import 'package:confnect/model/forums/TagForum.dart';
import 'package:confnect/model/forums/TalkForum.dart';
import 'package:flutter/material.dart';

import './Database.dart';
import '../../model/User.dart';

class MockAdapter implements Database {
  static List<Conference> _conferences = [
    Conference(
      "Web Summit",
      "Web Summit brings together the people and companies redefining the global tech industry.",
      "Lisbon",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.analyticsboosters.com%2Fwp-content%2Fuploads%2Fsites%2F2%2F2017%2F11%2F38234335176_01c0411980_o.jpg&f=1&nofb=1",
    ),
    Conference(
      "SINF",
      "A Semana de Informática (SINF), organizada pelo Núcleo de Informática da Associação de Estudantes da Faculdade de Engenharia da Universidade do Porto (NIAEFEUP), foi criada com o intuito de permitir aos estudantes, independentemente do curso, desenvolver as suas capacidades nas diversas áreas da Informática, promovendo a sua interação com o mundo empresarial através de eventos sociais.",
      "FEUP",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fempresashoje.pt%2Fwp-content%2Fuploads%2F2015%2F04%2Ffeup.jpg&f=1&nofb=1",
    ),
  ];
  static List<User> _users = [
    User(
      0,
      "Test User",
      "test",
      "123",
      {_conferences[0]: UserRole.ADMIN},
      "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=231081",
    ),
    User(
      1,
      "Donald Trump",
      "trump",
      "1",
      {_conferences[0]: UserRole.ATTENDEE},
      "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg",
      "Hello world!",
      {
        _conferences[0]: [1, 0]
      },
      [1, 6, 3],
    ),
    User(
      2,
      "Obama",
      "obama",
      "1",
      {_conferences[0]: UserRole.ATTENDEE, _conferences[1]: UserRole.ADMIN},
      "https://i.kym-cdn.com/entries/icons/facebook/000/030/329/cover1.jpg",
      "Obama bio baby!",
      {
        _conferences[0]: [0]
      },
      [7, 1, 2],
    ),
    User(
      3,
      "QUIM",
      "quim",
      "1",
      {_conferences[0]: UserRole.ATTENDEE},
      "https://thumbs.web.sapo.io/?W=1630&H=0&crop=center&delay_optim=1&epic=Y2JkMZRgjDe+oe0kRpgdEAigzldn9mL/x79Ak4FayV8oDSPK+OknuH6kbzY+lV16HvfdDjiG832j1TBGUosBMJYVapZOCXrImloUP1vTeiBTp+U=",
      "Call me QUIM",
      {
        _conferences[0]: [8]
      },
      [1, 5],
    ),
    User(
      4,
      "Souto",
      "souto",
      "1",
      {_conferences[0]: UserRole.ATTENDEE},
      "https://sigarra.up.pt/feup/pt/FOTOGRAFIAS_SERVICE.foto?pct_cod=238172",
      "Souto, Souto Souto",
      {
        _conferences[0]: [0, 8]
      },
      [5, 7, 1, 3],
    ),
    User(
      5,
      "Augusto Sousa",
      "aas",
      "1",
      {_conferences[0]: UserRole.ATTENDEE},
      "https://i.ytimg.com/vi/exEdW9vo1SM/maxresdefault.jpg",
      "AAS",
      {
        _conferences[0]: [0]
      },
      [7, 6, 2],
    ),
    User(
      6,
      "Lew Lee",
      "fanatic",
      "1",
      {_conferences[0]: UserRole.HOST},
      "http://031c074.netsolhost.com/WordPress/wp-content/uploads/2014/12/conspiracy-theory.jpg",
      "Call me QUIM",
      {
        _conferences[0]: [0, 8]
      },
      [1, 2, 4],
    ),
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
    Comment(
        _users[6],
        new Date(new DateTime.now().subtract(Duration(minutes: 3))),
        "Comentário do host"),
    Comment(
        _users[2],
        new Date(new DateTime.now().subtract(Duration(minutes: 1))),
        "Comentário depois do comentário do host"),
  ];

  static List<Post> _posts = [
    Post(
      0,
      _users[3],
      "Flutter master",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      comments: [_comments[0], _comments[1], _comments[6], _comments[7]],
      pinnedComment: _comments[6],
    ),
    Post(
      0,
      _users[1],
      "It deserves a 20!",
      "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      comments: [_comments[2], _comments[3]],
      pinnedComment: _comments[3],
    ),
    Post(
      0,
      _users[2],
      "Welcome!",
      "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      comments: [_comments[3], _comments[4]],
    ),
    Post(
      0,
      _users[3],
      "Make America Great Again!",
      "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      comments: [_comments[5]],
    ),
    Post(
        0,
        _users[4],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        0,
        _users[5],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        1,
        _users[1],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        1,
        _users[2],
        "It deserves a 21!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        1,
        _users[3],
        "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        1,
        _users[4],
        "Make America Great Again!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        1,
        _users[5],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        1,
        _users[1],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        2,
        _users[2],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        2,
        _users[3],
        "It deserves a 22!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        2,
        _users[4],
        "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        3,
        _users[5],
        "Flutter master",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        3,
        _users[1],
        "It deserves a 23!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        3,
        _users[2],
        "Welcome!",
        "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        3,
        _users[3],
        "Make America Great Again!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        4,
        _users[4],
        "Confnect is the greatest!",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
        4,
        _users[5],
        "Moustache Competition",
        "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
        new Date(new DateTime.now().subtract(Duration(minutes: 30))),
        comments: []),
    Post(
      8,
      _users[2],
      "Welcome!",
      "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      comments: [_comments[3], _comments[4]],
    ),
    Post(
      8,
      _users[3],
      "Make America Great Again!",
      "Lorem ipsum dolor sit amet, coni ahcdihfpiqhw coiqhwo chrc iysectetur adipiscing elit. Integer viverra le",
      new Date(new DateTime.now().subtract(Duration(minutes: 30))),
      comments: [_comments[5]],
    ),
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
      _conferences[0],
      0,
      "The rise of robots",
      "In this talk, we'll discuss the rise of robots and what it means for our survival as a species.",
      _users[6],
      "https://s3.amazonaws.com/media.eremedia.com/wp-content/uploads/2018/02/12141454/AI-robot-future-tech-trends.jpg",
      [_tags[0], _tags[1], _tags[2]],
    ),
    Talk(
      _conferences[0],
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

  String getAppDescription() {
    return "Your conference, at a button’s distance";
  }

  List<Conference> getConferences(User user) {
    return _conferences
        .where((Conference c) => user.isInConference(c))
        .toList();
  }

  void addConference(
      User creator,
      String conferenceName,
      String conferenceLocation,
      String conferenceDescription,
      String conferenceImageURL) {
    Conference conf = Conference(conferenceName, conferenceDescription,
        conferenceLocation, conferenceImageURL);
    _conferences.add(conf);
    creator.addRole(conf, UserRole.ADMIN);
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

    User user = new User(id, fullname, username, password, {}, profilePicUrl);
    //user.addForum(_forums[0]);

    _users.add(user);
  }

  void addPost(
      int forumId, String username, String title, String text, Date date) {
    for (var user in _users)
      if (user.getUsername() == username)
        _posts.add(
            Post(forumId, user, title, text, date, comments: List<Comment>()));
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

  void addTalk(Conference conference, String title, String description,
      String speaker, String image, List<Tag> tags) {
    tags.forEach((tag) {
      if (!_tags.contains(tag)) {
        addTag(tag);
      }
    });
    Talk talk = Talk(conference, _talks.length, title, description,
        getUser(speaker), image, tags);
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

  bool hasRole(Conference conference, String username, String role) {
    User user = getUser(username);
    if (user == null) return false;
    if (user.getRole(conference) == role) return true;
    return false;
  }

  List<Tag> getTags() => _tags;

  List<Talk> getTalks(Conference conference) =>
      _talks.where((Talk t) => t.getConference() == conference).toList();

  List<User> getUsers() {
    return _users;
  }

  List<Forum> getForums(Conference conference) {
    return _forums.where((Forum f) {
      if (f is TalkForum && f.getConference() != conference) {
        return false;
      }
      return true;
    }).toList();
  }

  Forum getForum(int id) {
    return _forums.firstWhere((element) => element.getId() == id);
  }

  List<Post> getForumPosts(int forumId) {
    return _posts.where((element) => element.getForumId() == forumId).toList();
  }

  List<Post> getPosts(Conference conference) {
    return _posts.where((element) {
      Forum f = getForum(element.getForumId());
      if (f is TalkForum && f.getConference() != conference) {
        return false;
      }
      return true;
    }).toList();
  }

  Meetup createMeetup(Post post, String location, DateTime date, TimeOfDay time,
      String description, User creator) {
    DateTime newDate =
        new DateTime(date.year, date.month, date.day, time.hour, time.minute);
    Meetup meetup = new Meetup(Date(newDate), location, description, creator);
    post.setMeetup(meetup);
    return meetup;
  }

  List<Forum> getUserPopularForums(Conference conference, User user) {
    List<int> forumIds = user.getUserForunsIds(conference);
    List<Forum> ret = [];
    forumIds.forEach((element) {
      ret.add(getForum(element));
    });
    ret.sort((Forum f1, Forum f2) {
      int f1NPosts = getForumPosts(f1.getId()).length;
      int f2NPosts = getForumPosts(f2.getId()).length;
      return f1NPosts.compareTo(f2NPosts);
    });
    return ret;
  }

  List<Post> getForumsPopularPosts(List<Forum> forums) {
    List<Post> ret = [];
    forums.forEach((element) {
      ret.addAll(getForumPosts(element.getId()));
    });
    ret.sort((Post p1, Post p2) {
      return p1.getNumberLikes().compareTo(p2.getNumberLikes());
    });
    return ret;
  }

  @override
  void changePinnedComment(Post post, Comment comment) {
    if (comment != null && post != null) {
      if (post.getPinnedComment() == comment)
        post.pinComment(null);
      else
        post.pinComment(comment);
    }
  }
}
