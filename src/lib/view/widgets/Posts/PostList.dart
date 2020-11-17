import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/widgets/GoBackButton.dart';
import 'package:confnect/view/widgets/PageTitle.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confnect/view/widgets/Posts/CreatePost.dart';
import '../../Page.dart';

class PostList extends StatefulPage {
  final Function _changeState;
  PostList(Controller controller, this._changeState, {Key key})
      : super(controller, key: key);
  @override
  _PostListState createState() =>
      _PostListState(super.getController(), this._changeState);
}

//class PostList extends StatelessPage {
class _PostListState extends State<PostList> {
  Controller _controller;
  Function _changeState;
  _PostListState(this._controller, this._changeState);

  int iconNum = 1;

  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    Database db = this._controller.getDatabase();
    List<Widget> ret = [
      Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: [
            Flexible(
              child: GoBackButton(
                fn: () {
                  widget._changeState(0);
                },
                margin: EdgeInsets.zero,
              ),
              flex: 1,
            ),
            Flexible(
              child: PageTitle(
                  db.getForum(this._controller.getCurrentForumId()).getTitle(),
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  scaleFactor: 0.9),
              flex: 7,
            ),
          ],
        ),
      ),
    ];
    ret.addAll(posts());
    if (this._controller.isAddingPost()) {
      return Column(
        children: <Widget>[
          Container(
            height: 190,
            child: ListView(children: posts()),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 3,
            color: Colors.black,
          ),
          CreatePostInput(
            this._controller,
            this._controller.getCurrentForumId(),
            this._changeState,
          ),
        ],
      );
    } else {
      return Column(children: [
        Expanded(child: ListView(children: ret)),
      ]);
    }
  }

  List<PostTile> posts() {
    Database db = this._controller.getDatabase();
    return db
        .getForumPosts(this._controller.getCurrentForumId())
        .map((post) => PostTile(post, this._controller))
        .toList();
  }
}
