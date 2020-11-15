import 'package:confnect/model/Comment.dart';
import 'package:confnect/view/widgets/User/avatar.dart';
import 'package:flutter/material.dart';

class CommentHeader extends StatefulWidget {
  Comment _comment;

  CommentHeader(this._comment);
  @override
  _CommentHeaderState createState() => _CommentHeaderState();
}

class _CommentHeaderState extends State<CommentHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              AvatarImg(widget._comment.getAuthor()),
              Text(widget._comment.getAuthor().getUsername()),
            ],
          ),
          Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(widget._comment.getDate().getMinutesSince()))
        ],
      ),
    );
  }
}
