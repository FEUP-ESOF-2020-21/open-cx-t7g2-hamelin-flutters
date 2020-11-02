import 'package:confnect/view/pages/WelcomeScreen.dart';
import '../controller/Controller.dart';
import './pages/Register.dart';
import './pages/Login.dart';
import 'package:flutter/material.dart';

class PageFactory {
  Controller controller;
  PageFactory(this.controller);

  Widget getWelcomeScreen() {
    return WelcomeScreen(controller);
  }

  Widget getLoginPage() {
    return Login(controller);
  }

  Widget getRegisterPage() {
    return Register(controller);
  }
}
