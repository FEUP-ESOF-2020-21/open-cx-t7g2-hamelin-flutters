import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteComment extends StatefulWidget {
  final Post _post;
  final Controller _controller;

  VoteComment(this._post, this._controller);
  @override
  _VoteCommentState createState() => _VoteCommentState();
}

class _VoteCommentState extends State<VoteComment> {
  _pressedLike(User user) {
    setState(() {
      if (widget._post.userLiked(user))
        widget._post.decrementLike(user);
      else
        widget._post.incrementLike(user);
    });
  }

  _pressedDisLike(User user) {
    setState(() {
      if (widget._post.userDisLiked(user))
        widget._post.decrementDislike(user);
      else
        widget._post.incrementDislike(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = widget._controller.getLoggedInUser();
    return Container(
      height: 30,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FittedBox(
            child: IconButton(
                icon: Icon(Icons.thumb_up),
                color: widget._post.userLiked(user) ? Colors.blue : Colors.grey,
                onPressed: () => _pressedLike(user)),
          ),
          Text(
            widget._post.getUserLikes().length.toString(),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          FittedBox(
            child: IconButton(
                icon: Icon(Icons.thumb_down),
                color:
                    widget._post.userDisLiked(user) ? Colors.blue : Colors.grey,
                onPressed: () => _pressedDisLike(user)),
          ),
          Text(
            widget._post.getUserDislikes().length.toString(),
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
            widget._post.getComments().length.toString(),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
