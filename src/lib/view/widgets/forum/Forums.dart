import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/pages/PostsPage.dart';
import 'package:confnect/view/widgets/forum/ForumList.dart';
import 'package:flutter/material.dart';

import '../../Page.dart';
import 'AllForumList.dart';

// ignore: must_be_immutable
class Forums extends StatefulPage {
  Function refreshState;
  Forums(Controller controller, this.refreshState, {Key key})
      : super(controller, key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = "Forums";

  @override
  _ForumsState createState() => _ForumsState(
        super.getController(),
        this.refreshState,
      );
}

class _ForumsState extends State<Forums> {
  Controller _controller;
  Function _refreshState;
  _ForumsState(this._controller, this._refreshState);

  void _viewForum(int forumId) {
    setState(() {
      this._controller.setCurrentForumId(forumId);
      this._refreshState();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._controller.getCurrentForumId() != -1)
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: PostsPage(this._controller, _viewForum, this._refreshState),
      );
    return AllForumList(this._controller, _viewForum);
  }
}
