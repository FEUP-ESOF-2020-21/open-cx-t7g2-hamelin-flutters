import 'package:flutter/material.dart';
import '../../controller/Controller.dart';

class LogoutButton extends StatelessWidget {
  final Controller _controller;
  LogoutButton(this._controller);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        onPressed: () {
          _controller.setLoggedInUserName(null);
          _controller.setCurrentForumId(-1);
          Navigator.popUntil(
              context, ModalRoute.withName(Navigator.defaultRouteName));
        });
  }
}
