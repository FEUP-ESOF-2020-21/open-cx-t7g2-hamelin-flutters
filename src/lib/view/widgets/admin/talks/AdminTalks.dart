import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/Page.dart';
import 'package:flutter/material.dart';

import '../talks/AdminTalkTile.dart';

class AdminTalks extends StatelessPage {
  AdminTalks(Controller controller, {Key key}) : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: talks());
  }

  List<Widget> talks() {
    Database db = super.getController().getDatabase();
    return db
        .getTalks()
        .map((e) => AdminTalkTile(super.getController(), e))
        .toList();
  }
}
