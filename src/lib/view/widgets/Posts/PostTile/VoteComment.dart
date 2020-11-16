import 'package:confnect/model/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteComment extends StatefulWidget {
  final Post post;

  VoteComment(this.post);
  @override
  _VoteCommentState createState() => _VoteCommentState();
}

class _VoteCommentState extends State<VoteComment> {
  bool liked = false;
  bool disliked = false;

  _pressedLike() {
    setState(() {
      if (liked) {
        liked = false;
        widget.post.decrementLike();
      } else {
        liked = true;
        widget.post.incrementLike();
        if (disliked) {
          disliked = false;
          widget.post.decrementDislike();
        }
      }
    });
  }

  _pressedDisLike() {
    setState(() {
      if (disliked) {
        disliked = false;
        widget.post.decrementDislike();
      } else {
        disliked = true;
        widget.post.incrementDislike();
        if (liked) {
          liked = false;
          widget.post.decrementLike();
        }
      }
    });
  }

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
                color: liked ? Colors.blue : Colors.grey,
                onPressed: () => _pressedLike()),
          ),
          Text(
            widget.post.getNumberLikes().toString(),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          FittedBox(
            child: IconButton(
                icon: Icon(Icons.thumb_down),
                color: disliked ? Colors.blue : Colors.grey,
                onPressed: () => _pressedDisLike()),
          ),
          Text(
            widget.post.getNumberDislikes().toString(),
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
            widget.post.getComments().length.toString(),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
