import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/pages/PostPage.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostContent.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post _post; // = new Post("Ademar", "Ensinando flutter", "lorem ipsum");
  final Controller _controller;

  const PostTile(this._post, this._controller);

  @override
  Widget build(BuildContext context) {
    void _postPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostPage(_controller, this._post)),
      );
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(onTap: _postPage, child: PostContent(_post, true)),
    );
  }
}
