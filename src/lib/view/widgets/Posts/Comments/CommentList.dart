import 'package:confnect/model/Comment.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentList extends StatefulWidget {
  List<Comment> _comments;
  CommentList(this._comments);
  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  List<CommentTile> comments() {
    return widget._comments.map((comment) => CommentTile(comment)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget._comments.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new CommentTile(widget._comments[index]);
        });
  }
}