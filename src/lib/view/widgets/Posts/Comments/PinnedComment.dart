import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentTile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class PinnedComment extends StatefulWidget {
  final Post _post;
  final User _host;
  final Controller _controller;
  final Function _refreshState;
  PinnedComment(this._post, this._host, this._controller, this._refreshState);
  @override
  _PinnedCommentState createState() => _PinnedCommentState();
}

class _PinnedCommentState extends State<PinnedComment> {
  Comment getPinnedComment() {
    return widget._post.getPinnedComment() == null
        ? null
        : widget._post.getPinnedComment();
  }

  Widget _getBeforeDate() {
    return widget._post.getPinnedComment().getAuthor().getUsername() ==
            widget._controller
                .getDatabase()
                .getForum(widget._post.getForumId())
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
        : Container();
  }

  Widget _getBeforeImage() {
    if (widget._controller
            .getDatabase()
            .getForum(widget._post.getForumId())
            .getSpeaker() ==
        widget._controller.getLoggedInUser()) {
      return InkWell(
          child: Icon(
            Icons.push_pin,
            size: 15,
            color: Colors.grey,
          ),
          onTap: () {
            widget._controller
                .getDatabase()
                .changePinnedComment(widget._post, getPinnedComment());
            widget._refreshState();
          });
    } else {
      return Icon(
        Icons.push_pin,
        size: 15,
        color: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget._host != null) {
      Comment comment = getPinnedComment();
      if (comment == null)
        return Container();
      else
        return new Column(
          children: [
            Divider(
              thickness: 2,
            ),
            new CommentTile(
              comment,
              imageHeight: 30,
              backgroundColor: Colors.yellow[50],
              beforeImage: this._getBeforeImage(),
              beforeDate: this._getBeforeDate(),
            ),
          ],
        );
    } else {
      return Container();
    }
  }
}
