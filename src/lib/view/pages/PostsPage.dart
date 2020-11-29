import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/widgets/GoBackButton.dart';
import 'package:confnect/view/widgets/PageTitle.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confnect/view/widgets/Posts/CreatePost.dart';
import '../Page.dart';

class PostsPage extends StatefulPage {
  final Function _viewForum;
  final Function _refreshState;
  PostsPage(Controller controller, this._viewForum, this._refreshState,
      {Key key})
      : super(controller, key: key);
  @override
  _PostsPageState createState() =>
      _PostsPageState(super.getController(), this._refreshState);
}

//class PostsPage extends StatelessPage {
class _PostsPageState extends State<PostsPage> {
  Controller _controller;
  Function _refreshState;
  _PostsPageState(this._controller, this._refreshState);

  int iconNum = 1;
  Icon icon = Icon(
    Icons.add_comment_outlined,
    size: 30,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    Database db = this._controller.getDatabase();
    List<Widget> ret = posts();
    //ret.addAll(posts());
    if (this._controller.isAddingPost()) {
      return ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 2 / 7,
            child: ListView(children: ret),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 3,
            color: Colors.black,
          ),
          CreatePostInput(this._controller,
              this._controller.getCurrentForumId(), this._refreshState)
        ],
      );
    } else {
      return ListView(children: ret);
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
