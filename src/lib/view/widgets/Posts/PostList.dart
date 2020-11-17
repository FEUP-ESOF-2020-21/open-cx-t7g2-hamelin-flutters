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
  final int _forumId;
  final Function _viewForum;
  PostList(Controller controller, this._forumId, this._viewForum, {Key key})
      : super(controller, key: key);
  @override
  _PostListState createState() => _PostListState(super.getController());
}

//class PostList extends StatelessPage {
class _PostListState extends State<PostList> {
  Controller _controller;
  _PostListState(this._controller);

  int iconNum = 1;
  Icon icon = Icon(
    Icons.add_comment_outlined,
    size: 30,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  Widget _addButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          this._controller.changeAddingPost();
          if (iconNum == 0) {
            icon = Icon(
              Icons.add_comment_outlined,
              size: 30,
              color: Color.fromARGB(255, 0, 0, 0),
            );
            iconNum = 1;
          } else if (iconNum == 1) {
            icon = Icon(
              Icons.arrow_downward_outlined,
              size: 30,
              color: Color.fromARGB(255, 0, 0, 0),
            );
            iconNum = 0;
          }
        });
      },
      elevation: 10,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      hoverColor: Color.fromARGB(200, 100, 100, 100), //Todo: Fix this color
      child: icon,
    );
  }

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
                  widget._viewForum(-1);
                },
                margin: EdgeInsets.zero,
              ),
              flex: 1,
            ),
            Flexible(
              child: PageTitle(db.getForum(widget._forumId).getTitle(),
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0), scaleFactor: 0.9),
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
          CreatePostInput(this._controller, widget._forumId),
          this._addButton()
        ],
      );
    } else {
      return Column(children: [
        Expanded(child: ListView(children: ret)),
        this._addButton()
      ]);
    }
  }

  List<PostTile> posts() {
    Database db = this._controller.getDatabase();
    return db
        .getForumPosts(widget._forumId)
        .map((post) => PostTile(post, this._controller))
        .toList();
  }
}
