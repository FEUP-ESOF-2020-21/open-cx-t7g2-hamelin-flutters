import 'package:confnect/model/Comment.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentHeader.dart';
import 'package:confnect/view/widgets/User/AvatarImg.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatefulWidget {
  Comment _comment;

  CommentTile(this._comment);
  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommentHeader(widget._comment),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(widget._comment.getDescription())),
        ],
      ),
    );
  }
}
