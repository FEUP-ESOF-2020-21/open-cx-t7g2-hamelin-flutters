import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:flutter/material.dart';

import 'TextSectionPost.dart';
import 'VoteComment.dart';

class PostContent extends StatefulWidget {
  final Post _post;
  final bool _showMore, showForum;
  final Controller _controller;
  final Function _refreshParent;
  PostContent(this._controller, this._post, this._showMore, this._refreshParent,
      {this.showForum = false});
  @override
  _PostContentState createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget._post.getAuthor().getAvatarUrl()),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              padding: EdgeInsets.all(10.0),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: widget.showForum
                        ? [
                            Icon(Icons.arrow_right),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  widget._controller
                                      .getDatabase()
                                      .getForum(widget._post.getForumId())
                                      .getTitle(),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ]
                        : [],
                  ),
                  TextSectionPost(
                      widget._post.getTitle(),
                      widget._post.getDescription(),
                      widget._showMore,
                      widget._controller,
                      widget._post),
                  VoteComment(
                      widget._post, widget._controller, widget._refreshParent),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
