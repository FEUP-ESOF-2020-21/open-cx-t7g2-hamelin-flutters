import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteComment extends StatefulWidget {
  @override
  _VoteCommentState createState() => _VoteCommentState();
}

class _VoteCommentState extends State<VoteComment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FittedBox(
            child: IconButton(
                icon: Icon(Icons.thumb_up),
                color: Colors.grey,
                onPressed: () {}),
          ),
          Text(
            "12",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          FittedBox(
            child: IconButton(
              icon: Icon(Icons.thumb_down),
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
          Text(
            "12",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          FittedBox(
            child: IconButton(
              icon: Icon(Icons.comment),
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
          Text(
            "4",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
