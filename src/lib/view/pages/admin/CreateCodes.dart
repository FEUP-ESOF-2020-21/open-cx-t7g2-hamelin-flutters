import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Code.dart';
import 'package:confnect/model/Conference.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/model/forums/TalkForum.dart';
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
    List<Code> codes = db.getConferenceCodes(_controller.getConference());
    String _code = generateCode(codes);
    List<Widget> tiles = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Select the forums to be associated with access code:",
          style: talkCodeTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    ];
    List<Forum> forums = db
        .getForums(_controller.getConference())
        .where((forum) => forum is TalkForum)
        .toList();

    List<ForumTile> forumTiles =
        forums.map((forum) => ForumTile(forum, () {}, admin: true)).toList();

    tiles.addAll(forumTiles);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addCode(_code, _controller.getConference(), forumTiles);
            setState(() {
              Navigator.pop(context);
              _onCodeCreated();
            });
          },
          elevation: 10,
          backgroundColor: Colors.white,
          focusColor: Colors.pink,
          child: Icon(
            Icons.check,
            size: 30,
            color: Colors.green,
          )),
      appBar: AppBar(
        title: Text(
          "Access Code: " + _code,
          style: pageTitleTextStyle,
        ),
      ),
      body: ListView(children: tiles),
    );
  }

  String generateCode(List<Code> codes) {
    var code;
    do {
      var uuid = Uuid();
      code = uuid.v4().substring(0, 8);
    } while (!isCodeNew(code, codes));
    return code;
  }

  bool isCodeNew(String code, List<Code> codes) {
    codes.forEach((c) {
      if (c.getCode() == code) return false;
    });
    return true;
  }

  void addCode(String code, Conference conference, List<ForumTile> forumTiles) {
    List<ForumTile> tiles =
        forumTiles.where((forumTile) => forumTile.isSelected()).toList();

    _controller.getDatabase().addCode(Code(
        code, tiles.map((tile) => tile.getTileForum()).toList(), conference));
  }
}
