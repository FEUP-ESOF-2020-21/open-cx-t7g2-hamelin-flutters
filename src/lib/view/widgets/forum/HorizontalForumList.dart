import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/widgets/forum/ForumTileMain.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HorizontalForumList extends StatelessWidget {
  final Controller _controller;
  final Function _refreshState;
  List<Forum> forumsList;

  HorizontalForumList(this._controller, this._refreshState, this.forumsList);
  List<dynamic> forums() {
    if (this.forumsList.isEmpty) {
      this.forumsList =
          _controller.getDatabase().getForums(_controller.getConference());
    }
    return this
        .forumsList
        .map((forum) => ForumTileMain(forum, _controller, _refreshState))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: ListView(scrollDirection: Axis.horizontal, children: forums()));
  }
}
