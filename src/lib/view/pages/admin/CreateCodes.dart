import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/forum/ForumTile.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CreateCodes extends StatefulPage {
  final Function _onCodeCreated;
  CreateCodes(Controller controller, this._onCodeCreated, {Key key})
      : super(controller, key: key);

  @override
  State<CreateCodes> createState() {
    return _CreateCodesState(super.getController(), _onCodeCreated);
  }
}

class _CreateCodesState extends State<CreateCodes> {
  final Controller _controller;
  final Function _onCodeCreated;

  _CreateCodesState(this._controller, this._onCodeCreated);

  @override
  Widget build(BuildContext context) {
    Database db = _controller.getDatabase();
    String _code = generateCode();
    List<ForumTile> tiles = db
        .getForums()
        .map((forum) => ForumTile(forum, () {}, admin: true))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registry Code: " + _code,
          style: pageTitleTextStyle,
        ),
      ),
      body: ListView(children: tiles),
    );
  }

  // () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => AddTalk(_controller, _refreshState)),
  //       );
  //     }

  String generateCode() {
    var code;
    do {
      var uuid = Uuid();
      code = uuid.v4().substring(0, 8);
    } while (!isCodeNew(code));
    return code;
  }

  bool isCodeNew(String code) {
    // _talks.forEach((talk) {
    //   if (talk.getCode() == code) return false;
    // });
    return true;
  }
}
