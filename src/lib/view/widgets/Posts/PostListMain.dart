import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTextVote.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTileMain.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostListMain extends StatefulWidget {
  Controller _controller;
  PostListMain(this._controller);
  @override
  _PostListMainState createState() => _PostListMainState();
}

class _PostListMainState extends State<PostListMain> {
  List<PostTileMain> posts() {
    Database db = widget._controller.getDatabase();
    return db
        .getPosts()
        //.getForumPosts(widget._controller.getCurrentForumId())
        .map((post) => PostTileMain(post, widget._controller))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: posts());
  }
}
