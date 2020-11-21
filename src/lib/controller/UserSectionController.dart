import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/MainPage/MainAppBar.dart';
import 'package:flutter/material.dart';

class UserSectionController {
  static List<Widget> initAppBars(List<Widget> action, Controller controller) {
    return [
      AppBar(
        title: Text(
          "Forums",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
      AppBar(
        title: Text(
          "Search",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
      AppBar(
        title: Text(
          "Profile",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
      PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: MainAppBar(controller, action)),
    ];
  }
}
