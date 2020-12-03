import 'package:confnect/model/Comment.dart';
import 'package:confnect/view/widgets/Posts/UserTimeHeader.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatefulWidget {
  final Comment _comment;
  final double fontSize;
  final double imageHeight;

  CommentTile(this._comment, {this.fontSize = 13, this.imageHeight = 20});
  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserTimeHeader(
              widget._comment.getAuthor(),
              widget._comment.getDate(),
              widget.imageHeight,
              fontSize: widget.fontSize,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  widget._comment.getDescription(),
                  style: TextStyle(fontSize: widget.fontSize),
                )),
          ],
        ),
      ),
    );
  }
}
