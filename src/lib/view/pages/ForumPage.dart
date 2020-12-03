import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Forum.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulPage {
  Forum _forum;
  Controller _controller;
  ForumPage(this._controller, this._forum) : super(_controller);

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
        child: PostList(widget._controller, widget._forum.getId()),
      ),
    );
  }
}
