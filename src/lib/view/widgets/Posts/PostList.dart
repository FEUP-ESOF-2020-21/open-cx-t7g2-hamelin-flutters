import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/widgets/GoBackButton.dart';
import 'package:confnect/view/widgets/PageTitle.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Page.dart';

class PostList extends StatelessPage {
  final int _forumId;
  final Function _viewForum;
  PostList(Controller controller, this._forumId, this._viewForum, {Key key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    Database db = super.getController().getDatabase();
    List<Widget> ret = [
      Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: [
            Flexible(
              child: GoBackButton(
                fn: () {
                  _viewForum(-1);
                },
                margin: EdgeInsets.zero,
              ),
              flex: 1,
            ),
            Flexible(
              child: PageTitle(db.getForum(_forumId).getTitle(),
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0), scaleFactor: 0.9),
              flex: 7,
            ),
          ],
        ),
      ),
    ];
    ret.addAll(posts());
    return ListView(children: ret);
  }

  List<PostTile> posts() {
    Database db = super.getController().getDatabase();
    return db
        .getForumPosts(_forumId)
        .map((post) => PostTile(post, super.getController()))
        .toList();
  }
}
