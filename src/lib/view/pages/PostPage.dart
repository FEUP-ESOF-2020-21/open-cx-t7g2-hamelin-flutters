import 'dart:async';

import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/posts/comments/AddComent.dart';
import 'package:confnect/view/widgets/posts/comments/CommentList.dart';
import 'package:confnect/view/widgets/posts/comments/PinnedComment.dart';
import 'package:confnect/view/widgets/posts/posttile/PostTextVote.dart';

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

  void _refreshState() {
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
                  PinnedComment(widget._post, widget.host, widget._controller,
                      _refreshState),
                  Divider(
                    thickness: 2,
                  ),
                  CommentList(
                    widget._post.getComments(),
                    widget._controller,
                    refreshState: _refreshState,
                    post: widget._post,
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddComment(
              widget._controller,
              onSubmitted: (user, date, text) {
                setState(() {
                  Comment comment = new Comment(user, date, text);
                  widget._post.getComments().add(comment);
                  if (widget._post.getPinnedComment() == null &&
                      user ==
                          widget._controller
                              .getDatabase()
                              .getForum(widget._post.getForumId())
                              .getSpeaker()) {
                    widget._post.pinComment(comment);
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
