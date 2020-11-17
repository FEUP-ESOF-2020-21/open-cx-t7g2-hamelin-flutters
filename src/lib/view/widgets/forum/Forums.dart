import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/ForumList.dart';
import 'package:flutter/material.dart';

import '../../Page.dart';

class Forums extends StatefulPage {
  Function changeState;
  Forums(Controller controller, this.changeState, {Key key})
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
  _ForumsState createState() =>
      _ForumsState(super.getController(), this.changeState);
}

class _ForumsState extends State<Forums> {
  Controller _controller;
  Function _changeState;
  _ForumsState(this._controller, this._changeState);

  void _viewForum(int forumId) {
    this._controller.setCurrentForumId(forumId);
    print(forumId);
    if (forumId == -1) {
      this._changeState(0);
    } else {
      this._changeState(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ForumList(_controller, _viewForum);
  }
}
