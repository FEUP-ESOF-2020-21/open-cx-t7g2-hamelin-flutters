import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/widgets/forum/ForumTileMain.dart';
import 'package:flutter/material.dart';

class HorizontalForumList extends StatelessWidget {
  final Controller _controller;

  HorizontalForumList(this._controller);
  List<dynamic> forums() {
    Database db = _controller.getDatabase();
    return db.getForums().map((forum) => ForumTileMain(forum)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: ListView(scrollDirection: Axis.horizontal, children: forums()));
  }
}
