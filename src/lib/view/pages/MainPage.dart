import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/posts/PostListMain.dart';
import 'package:confnect/view/widgets/forum/HorizontalForumList.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatefulPage {
  Controller _controller;
  Function _viewForum, _refreshState;
  MainPage(this._controller, this._viewForum, this._refreshState)
      : super(_controller);

  @override
  _MainPageState createState() => _MainPageState(_viewForum, _refreshState);
}

class _MainPageState extends State<MainPage> {
  // ignore: unused_field
  Function _refreshState, _viewForum;
  _MainPageState(this._viewForum, this._refreshState);

  @override
  Widget build(BuildContext context) {
    User loggedInUser = widget._controller.getLoggedInUser();
    List<Forum> forums = widget._controller
        .getDatabase()
        .getUserPopularForums(widget._controller.getConference(), loggedInUser);
    List<Post> posts =
        widget._controller.getDatabase().getForumsPopularPosts(forums);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Your Communities",
                style: titleTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
            HorizontalForumList(widget._controller, _viewForum, forums),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Text(
                "Reccomended Posts",
                style: titleTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
            PostListMain(widget._controller, widget._refreshState, posts),
          ],
        ),
      ),
    );
  }
}
