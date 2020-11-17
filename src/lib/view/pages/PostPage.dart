import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentList.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostContent.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulPage {
  final Post _post;
  PostPage(Controller controller, this._post, {Key key})
      : super(controller, key: key);
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._post.getTitle()),
      ),
      body: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PostContent(widget._post, false)),
            Divider(),
            Expanded(child: CommentList(widget._post.getComments())),
          ],
        ),
      ),
    );
  }
}
