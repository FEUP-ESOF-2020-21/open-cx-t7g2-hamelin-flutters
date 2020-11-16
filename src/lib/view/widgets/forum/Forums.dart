import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/ForumList.dart';
import 'package:flutter/material.dart';

import '../../Page.dart';

class Forums extends StatefulPage {
  Forums(Controller controller, {Key key}) : super(controller, key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = "Forums";

  @override
  _ForumsState createState() => _ForumsState(super.getController());
}

class _ForumsState extends State<Forums> {
  Controller _controller;
  int _currentForumId = -1;
  _ForumsState(this._controller);

  void _viewForum(int forumId) {
    setState(() {
      _currentForumId = forumId;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._currentForumId != -1)
      return PostList(this._controller, this._currentForumId, _viewForum);
    return ForumList(_controller, _viewForum);
    /*body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "ZAS",
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              child: ForumList(),
              //color: Colors.cyan,
            ),
          ],
        ),
      ),*/
    /*floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/
  }
}
