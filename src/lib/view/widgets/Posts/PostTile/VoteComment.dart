import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteComment extends StatefulWidget {
  @override
  _VoteCommentState createState() => _VoteCommentState();
}

class _VoteCommentState extends State<VoteComment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  color: Colors.grey,
                  onPressed: () {}),
              IconButton(
                icon: Icon(Icons.thumb_down),
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.comment),
          color: Colors.grey,
          onPressed: () {},
        ),
      ],
    );
  }
}
