import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/admin/codes/AdminCodeTile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminCodes extends StatelessPage {
  Function _refreshState;
  AdminCodes(Controller controller, this._refreshState, {Key key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: codes());
  }

  List<Widget> codes() {
    Database db = super.getController().getDatabase();
    return db
        .getConferenceCodes(super.getController().getConference())
        .map(
            (code) => AdminCodeTile(super.getController(), _refreshState, code))
        .toList();
  }
}
