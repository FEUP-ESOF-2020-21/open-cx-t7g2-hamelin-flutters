import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/widgets/posts/comments/CommentTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentList extends StatefulWidget {
  List<Comment> _comments;
  final Controller _controller;
  Function refreshState;
  final Post post;
  CommentList(this._comments, this._controller, {this.refreshState, this.post});
  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  List<CommentTile> comments() {
    return widget._comments.map((comment) => CommentTile(comment)).toList();
  }

  Widget _getBeforeDate(index) {
    if (widget.post != null &&
        widget._controller.getLoggedInUser() ==
            widget._controller
                .getDatabase()
                .getForum(widget.post.getForumId())
                .getSpeaker()) {
      return Row(
        children: [
          widget._comments[index].getAuthor().getUsername() ==
                  widget._controller
                      .getDatabase()
                      .getForum(widget.post.getForumId())
                      .getSpeaker()
                      .getUsername()
              ? Container(
                  width: 45,
                  padding: EdgeInsets.only(
                    right: 2,
                    left: 2,
                  ),
                  margin: EdgeInsets.only(right: 5),
                  child: Text(
                    'Host',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              : Container(),
          InkWell(
            child: Icon(
              Icons.delete_rounded,
              size: 15,
              color: Colors.grey,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: new Text(
                      "Delete comment",
                      textScaleFactor: 1.3,
                    ),
                    content: new Text(
                        "Are you sure you want to delete this comment?"),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text("Yes"),
                        onPressed: () {
                          widget._controller.getDatabase().deleteComment(
                              widget._comments[index], widget.post);
                          widget.refreshState();
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text("No!"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          InkWell(
            child: Icon(
              widget.post.getPinnedComment() == widget._comments[index]
                  ? Icons.push_pin_outlined
                  : Icons.push_pin,
              size: 15,
              color: Colors.grey,
            ),
            onTap: () {
              widget._controller
                  .getDatabase()
                  .changePinnedComment(widget.post, widget._comments[index]);
              widget.refreshState();
            },
          ),
        ],
      );
    }
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
            beforeDate: this._getBeforeDate(index),
          );
        });
  }
}
