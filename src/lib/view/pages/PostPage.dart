import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentList.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostContent.dart';
import '../../model/User.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulPage {
  Post _post;
  Controller _controller;
  PostPage(this._controller, this._post, {Key key})
      : super(_controller, key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    String username = widget._controller.getLoggedInUserName();
    User u = widget._controller.getDatabase().getUser(username);
    Date d = new Date(DateTime.now());
    setState(() {
      widget._post.addComment(u, d, text);
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._post.getTitle()),
      ),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 70),
              child: ListView(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: PostContent(widget._post, false)),
                  Divider(),
                  CommentList(widget._post.getComments()),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: _AddCommentComposer(),
          )
        ],
      ),
    );
  }

  Widget _AddCommentComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
}
