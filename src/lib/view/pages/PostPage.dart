import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/Comments/AddComent.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentList.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTextVote.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostPage extends StatefulPage {
  Post _post;
  Controller _controller;
  PostPage(this._controller, this._post, {Key key})
      : super(_controller, key: key);

  @override
  PostPageState createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._post.getTitle()),
      ),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 70),
              child: ListView(
                children: [
                  Container(
                      /*decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),*/
                      child: PostTextVote(widget._post)),
                  Divider(),
                  CommentList(widget._post.getComments()),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddComment(widget._controller, widget._post, this),
          )
        ],
      ),
    );
  }
}
