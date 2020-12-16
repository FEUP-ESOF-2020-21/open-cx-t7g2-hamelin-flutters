import 'package:flutter/material.dart';
import '../../controller/Controller.dart';

// ignore: must_be_immutable
class ExitConferenceButton extends StatelessWidget {
  final Controller _controller;
  Color _color;
  ExitConferenceButton(this._controller, [this._color]);
  setColor(Color color) {
    this._color = color;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.close_rounded,
          color: _color == null ? Colors.black : _color,
        ),
        onPressed: () {
          _controller.setConference(null);
        });
  }
}
