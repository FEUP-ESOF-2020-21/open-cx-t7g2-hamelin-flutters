import 'package:confnect/model/Post.dart';
import 'package:confnect/view/widgets/User/avatar.dart';
import 'package:flutter/material.dart';

import 'TextSectionPost.dart';
import 'VoteComment.dart';

class PostContent extends StatefulWidget {
  final Post _post;
  final bool _showMore;
  PostContent(this._post, this._showMore);
  @override
  _PostContentState createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            child: AvatarImg(widget._post.getAuthor()),
            padding: EdgeInsets.all(10.0),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            //padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextSectionPost(widget._post.getTitle(),
                    widget._post.getDescription(), widget._showMore),
                VoteComment(widget._post),
              ],
            ),
          ),
        )
      ],
    );
  }
}
