import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/GoBackButton.dart';
import 'package:flutter/material.dart';

import '../ExitConferenceButton.dart';

class MainAppBar {
  final Controller _controller;
  final Database db;
  final Function _refreshState;
  MainAppBar(this._controller, this.db, this._refreshState);
  Text _getCurrentUser() {
    if (_controller.getLoggedInUserName() == null)
      return Text(
        "Hi, NotLoggedInUser",
        style: mainpageTitleTextStyle,
      );
    else
      return Text(
        "Hi, " + _controller.getLoggedInFullName(),
        style: mainpageTitleTextStyle,
      );
  }

  void _refresh() {
    this._controller.setCurrentForumId(-1);
    _refreshState();
  }

  Widget getAppBar() {
    if (this._controller.getCurrentForumId() == -1) {
      return PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/main_page_app_bar.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: AppBar(
            title: _getCurrentUser(),
            backgroundColor: Colors.transparent,
            actions: [ExitConferenceButton(_controller, Colors.white)],
          ),
        ),
      );
    } else {
      return AppBar(
        title: Expanded(
          child: Text(
            db.getForum(this._controller.getCurrentForumId()).getTitle(),
            style: pageTitleTextStyle,
          ),
        ),
        actions: [ExitConferenceButton(_controller)],
        leading: new GoBackButton(
            fn: _refresh, margin: EdgeInsets.only(top: 5.0, left: 10.0)),
      );
    }
  }
}
