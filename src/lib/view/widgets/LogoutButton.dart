import 'package:flutter/material.dart';
import '../../controller/Controller.dart';

class LogoutButton extends StatelessWidget {
  final Controller _controller;
  final Color _color;
  LogoutButton(this._controller, [this._color]);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.logout,
          color: _color == null ? Colors.black : _color,
        ),
        onPressed: () {
          _controller.setLoggedInUserName(null);
          _controller.setCurrentForumId(-1);
          Navigator.popUntil(
              context, ModalRoute.withName(Navigator.defaultRouteName));
        });
  }
}
