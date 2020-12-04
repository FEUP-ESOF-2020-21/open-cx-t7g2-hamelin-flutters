import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/Talk.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentTile.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class PinnedComment extends StatefulWidget {
  final Post _post;
  final User _host;
  PinnedComment(this._post, this._host);
  @override
  _PinnedCommentState createState() => _PinnedCommentState();
}

class _PinnedCommentState extends State<PinnedComment> {
  Comment getPinnedComment() {
    return widget._post.getPinnedComment() == null
        ? null
        : widget._post.getPinnedComment();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._host != null) {
      Comment comment = getPinnedComment();
      if (comment == null)
        return Container();
      else
        return new Column(
          children: [
            Divider(
              thickness: 2,
            ),
            new CommentTile(
              comment,
              fontSize: 15,
              imageHeight: 30,
              backgroundColor: Colors.yellow[50],
              beforeImage: Icon(
                Icons.push_pin,
                color: Colors.grey,
              ),
            ),
          ],
        );
    } else {
      return Container();
    }
  }
}
