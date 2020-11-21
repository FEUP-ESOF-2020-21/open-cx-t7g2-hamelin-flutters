import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostList extends StatefulWidget {
  Controller _controller;
  PostList(this._controller);
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<PostTile> posts() {
    Database db = widget._controller.getDatabase();
    return db
        .getForumPosts(widget._controller.getCurrentForumId())
        .map((post) => PostTile(post, widget._controller))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: posts());
  }
}
