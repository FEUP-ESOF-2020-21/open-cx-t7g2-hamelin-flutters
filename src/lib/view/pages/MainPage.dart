import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Forum.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/ForumTileMain.dart';
import 'package:confnect/view/widgets/forum/HorizontalForumList.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatefulPage {
  Controller _controller;
  MainPage(this._controller) : super(_controller);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Top Communities",
              style: titleTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          HorizontalForumList(widget._controller),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Text(
              "Trending Posts",
              style: titleTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          //Expanded(child: PostList(widget._controller)),
        ],
      ),
    );
  }
}
