import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/Page.dart';
import './ForumTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForumList extends StatelessPage {
  final Function _viewForum;
  ForumList(Controller controller, this._viewForum, {Key key})
      : super(controller, key: key);
  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    return ListView(children: forums());
  }

  List<dynamic> forums() {
    Database db = super.getController().getDatabase();
    return db.getForums().map((forum) => ForumTile(forum, _viewForum)).toList();
  }
}
