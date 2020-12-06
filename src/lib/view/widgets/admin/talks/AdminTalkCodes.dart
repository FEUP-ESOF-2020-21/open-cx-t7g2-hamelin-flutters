import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/Page.dart';
import 'package:flutter/material.dart';

import 'AdminTalkCodeTile.dart';

// ignore: must_be_immutable
class AdminTalkCodes extends StatelessPage {
  Function _refreshState;
  AdminTalkCodes(Controller controller, this._refreshState, {Key key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: talks());
  }

  List<Widget> talks() {
    Database db = super.getController().getDatabase();
    return db
        .getTalks()
        .map((e) => AdminTalkCodeTile(super.getController(), _refreshState, e))
        .toList();
  }
}
