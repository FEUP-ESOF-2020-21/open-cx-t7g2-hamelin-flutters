import 'package:confnect/controller/Controller.dart';

import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForumPage extends StatefulPage {
  Forum _forum;
  Controller _controller;
  Function _refreshState;
  ForumPage(this._controller, this._forum, this._refreshState)
      : super(_controller);

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._forum.getTitle())),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: PostList(
            widget._controller, widget._forum.getId(), widget._refreshState),
      ),
    );
  }
}
