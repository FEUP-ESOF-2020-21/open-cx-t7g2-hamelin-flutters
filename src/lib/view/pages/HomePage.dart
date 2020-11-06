import 'package:flutter/material.dart';
import '../Page.dart';
import '../../controller/Controller.dart';
import './WelcomeScreen.dart';
import './UserSection.dart';

class HomePage extends StatefulPage {
  HomePage(Controller controller, {Key key}) : super(controller, key: key);

  _HomePageState createState() => _HomePageState(super.getController());
}

class _HomePageState extends State<HomePage> {
  final Controller _controller;
  _HomePageState(this._controller) {
    this._controller.setOnSessionChange(this._onSessionChange);
  }

  void _onSessionChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (this._controller.getLoggedInUserName() == null)
      return WelcomeScreen(this._controller);
    else
      return UserSection(this._controller);
  }
}
