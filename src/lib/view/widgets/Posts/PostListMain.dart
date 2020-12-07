import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTileMain.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostListMain extends StatefulWidget {
  Controller _controller;
  Function _refreshState;
  List<Post> posts;
  PostListMain(this._controller, this._refreshState, this.posts);
  @override
  _PostListMainState createState() => _PostListMainState();
}

class _PostListMainState extends State<PostListMain> {
  List<PostTileMain> posts() {
    if (widget.posts.isEmpty)
      widget.posts = widget._controller.getDatabase().getPosts();
    return widget.posts
        .map((post) =>
            PostTileMain(post, widget._controller, widget._refreshState))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: posts().length,
    //     itemBuilder: (BuildContext ctxt, int index) {
    //       return (posts()[index]);
    //     });
    return Column(children: posts());
    //return ListView(children: posts());
  }
}
