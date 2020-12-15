import 'package:flutter/material.dart';
import '../../controller/Controller.dart';

class LogoutButton extends StatelessWidget {
  final Controller _controller;
  Color _color;
  LogoutButton(this._controller, [this._color]);
  setColor(Color color) {
    this._color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 20),
      child: IconButton(
          icon: Icon(
            Icons.logout,
            color: _color == null ? Colors.black : _color,
          ),
          onPressed: () {
            _controller.setLoggedInUserName(null);
            _controller.setCurrentForumId(-1);
            Navigator.popUntil(
                context, ModalRoute.withName(Navigator.defaultRouteName));
          }),
    );
  }
}
