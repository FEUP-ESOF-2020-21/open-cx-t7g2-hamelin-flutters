import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/Page.dart';
import './ForumTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllForumList extends StatelessPage {
  final Function _viewForum;
  List<Forum> _suggestedForums = new List();

  AllForumList(Controller controller, this._viewForum, {Key key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    return ListView(
      children: [
        /*Container(
          margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: Text(
            'Suggested Forums',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat'),
          ),
        ),
        ListView(
            children: suggestedForums(),
            shrinkWrap: true,
            physics: ClampingScrollPhysics()),
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: Text(
            'Other Forums',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat'),
          ),
        ),*/
        ListView(
            children: otherforums(),
            shrinkWrap: true,
            physics: ClampingScrollPhysics()),
      ],
    );
  }

  List<dynamic> otherforums() {
    Database db = super.getController().getDatabase();

    return db
        .getForums()
        .toList()
        .map((forum) => ForumTile(forum, _viewForum))
        .toList();

    //return difference.map((forum) => ForumTile(forum, _viewForum)).toList();
  }

  List<dynamic> suggestedForums() {
    Database db = super.getController().getDatabase();
    String username = super.getController().getLoggedInUserName();
    User u = db.getUser(username);

    List<Forum> _userForums =
        u.getUserForunsIds().map((id) => db.getForum(id)).toList();
    if (_userForums.length == 0) _userForums = u.getForums();

    List<Tag> _userTags = u.getTags();
    if (_userTags.length == 0) {
      _userForums.forEach((forum) {
        _userTags.addAll(forum.getTags());
      });
    }

    print(_userForums);
    print(_userTags);

    _suggestedForums = new List();

    db.getForums().forEach((forum) {
      for (int i = 0; i < _userTags.length; i++) {
        if (forum.getTags() == null) continue;
        print('FORUM TAGS : ' + forum.getTags().toString());
        if (forum.getTags().contains(_userTags[i])) {
          _suggestedForums.add(forum);
          break;
        }
      }
    });

    print(_suggestedForums);

    return _suggestedForums
        .map((forum) => ForumTile(forum, _viewForum))
        .toList();
  }
}
