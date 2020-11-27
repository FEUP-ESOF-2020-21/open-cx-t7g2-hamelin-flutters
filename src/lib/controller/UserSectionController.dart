import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/MainPage/MainAppBar.dart';
import 'package:flutter/material.dart';

class UserSectionController {
  static List<Widget> initAppBars(
      List<Widget> action, Controller controller, Function refreshState) {
    return [
      MainAppBar(controller, action, controller.getDatabase(), refreshState)
          .getAppBar(),
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
      AppBar(
        title: Text(
          "Forums",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
    ];
  }
}
