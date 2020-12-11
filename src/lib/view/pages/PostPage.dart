import 'dart:async';

import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/Comments/AddComent.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentList.dart';
import 'package:confnect/view/widgets/Posts/Comments/PinnedComment.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTextVote.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostPage extends StatefulPage {
  Post _post;
  Controller _controller;
  final Function _refreshParent;
  User host;
  PostPage(this._controller, this._post, this._refreshParent,
      {Key key, this.host})
      : super(_controller, key: key);

  @override
  PostPageState createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  var id;
  void refreshData() {
    id++;
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

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
                  PostTextVote(
                      widget._post, widget._controller, widget._refreshParent),
                  PinnedComment(widget._post, widget.host),
                  Divider(
                    thickness: 2,
                  ),
                  CommentList(widget._post.getComments()),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddComment(
              widget._controller,
              widget._post.getComments(),
              onSubmitted: (user, date, text) {
                setState(() {
                  widget._post.getComments().add(new Comment(user, date, text));
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
