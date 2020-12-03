import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/GoBackButton.dart';
import 'package:flutter/material.dart';

class MainAppBar {
  final Controller _controller;
  final List<Widget> _action;
  final Database db;
  final Function _refreshState;
  MainAppBar(this._controller, this._action, this.db, this._refreshState);
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
        child: AppBar(
          title: _getCurrentUser(),
          flexibleSpace: Image(
            image: AssetImage('assets/main_page_app_bar.jpg'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          actions: _action,
        ),
      );
    } else {
      return AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            db.getForum(this._controller.getCurrentForumId()).getTitle(),
            style: pageTitleTextStyle,
          ),
        ),
        actions: _action,
        leading: new GoBackButton(
            fn: _refresh, margin: EdgeInsets.only(top: 5.0, left: 10.0)),
      );
    }
  }
}
