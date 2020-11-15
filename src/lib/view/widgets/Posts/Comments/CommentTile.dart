import 'package:confnect/model/Comment.dart';
import 'package:confnect/view/widgets/User/avatar.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatefulWidget {
  Comment _comment;

  CommentTile(this._comment);
  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        //border: Border.all(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AvatarImg(widget._comment.getAuthor()),
                Text(widget._comment.getAuthor().getUsername()),
                //Text(DateTime.now().subtract(widget._comment.getDate()))
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(widget._comment.getDescription())),
        ],
      ),
    );
  }
}
