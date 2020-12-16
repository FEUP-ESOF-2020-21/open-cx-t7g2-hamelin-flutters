import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/forum/ForumTile.dart';
import 'package:flutter/material.dart';

class CodeForumList extends StatefulPage {
  final List<Forum> _codeForums;
  CodeForumList(Controller controller, this._codeForums, {Key key})
      : super(controller, key: key);

  @override
  State<CodeForumList> createState() {
    return _CodeForumListState(super.getController(), _codeForums);
  }
}

class _CodeForumListState extends State<CodeForumList> {
  final Controller _controller;
  final List<Forum> _codes;

  _CodeForumListState(this._controller, this._codes);

  @override
  Widget build(BuildContext context) {
    List<ForumTile> tiles =
        _codes.map((codeForum) => ForumTile(codeForum, (int e) {})).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forums",
          style: pageTitleTextStyle,
        ),
      ),
      body: ListView(children: tiles),
    );
  }
}
