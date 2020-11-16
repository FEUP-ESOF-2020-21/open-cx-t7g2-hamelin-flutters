import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/MockAdapter.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confnect/view/widgets/Posts/CreatePost.dart';

class PostList extends StatelessWidget {
  final Controller controller;
  PostList({this.controller});
  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    if (this.controller.isAddingPost()) {
      return Column(
        children: <Widget>[
          Container(
            height: 190,
            child: ListView(children: posts()),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 3,
            color: Colors.black,
          ),
          CreatePostInput(this.controller),
        ],
      );
    } else {
      return ListView(children: posts());
    }
  }

  List<PostTile> posts() {
    return MockAdapter.getPosts().map((post) => PostTile(post)).toList();
  }
}
