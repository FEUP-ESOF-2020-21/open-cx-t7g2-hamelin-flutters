import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentList extends StatefulWidget {
  List<Comment> _comments;
  final Controller controller;
  Function refreshState;
  final Post post;
  CommentList(this._comments, {this.controller, this.refreshState, this.post});
  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  List<CommentTile> comments() {
    return widget._comments.map((comment) => CommentTile(comment)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: widget._comments.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new CommentTile(
            widget._comments[index],
            beforeDate: widget.controller.getLoggedInUser() ==
                    widget.controller
                        .getDatabase()
                        .getForum(widget.post.getForumId())
                        .getSpeaker()
                ? InkWell(
                    child: Icon(
                      widget.post.getPinnedComment() == widget._comments[index]
                          ? Icons.push_pin_outlined
                          : Icons.push_pin,
                      size: 15,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      widget.controller.getDatabase().changePinnedComment(
                          widget.post, widget._comments[index]);
                      widget.refreshState();
                    },
                  )
                : null,
          );
        });
  }
}
