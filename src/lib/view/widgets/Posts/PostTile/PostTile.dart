import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/pages/PostPage.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostContent.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post _post; // = new Post("Ademar", "Ensinando flutter", "lorem ipsum");
  final Controller _controller;
  final User host;
  final bool showForum;
  final Function _refreshState;

  const PostTile(this._post, this._controller, this._refreshState,
      {this.host, this.showForum = false});

  @override
  Widget build(BuildContext context) {
    void _postPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostPage(
                  this._controller,
                  this._post,
                  this._refreshState,
                  host: this.host,
                )),
      );
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
          onTap: _postPage,
          child: PostContent(_controller, _post, true, showForum: showForum)),
    );
  }
}
