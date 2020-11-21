import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final Controller _controller;
  final List<Widget> _action;
  MainAppBar(this._controller, this._action);
  Text _getCurrentUser() {
    if (_controller.getLoggedInUserName() == null)
      return Text(
        "Hi, NotLoggedInUser",
        style: mainpageTitleTextStyle,
      );
    else
      return Text(
        "Hi," + _controller.getLoggedInFullName(),
        style: mainpageTitleTextStyle,
      );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _getCurrentUser(),
      flexibleSpace: Image(
        image: AssetImage('assets/main_page_app_bar.jpg'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      actions: _action,
    );
  }
}
