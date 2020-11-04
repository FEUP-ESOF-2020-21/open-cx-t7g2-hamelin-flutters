import 'package:confnect/view/pages/WelcomeScreen.dart';
import '../controller/Controller.dart';
import './pages/Register.dart';
import './pages/Login.dart';
import './pages/UserStartPage.dart';
import 'package:flutter/material.dart';

class PageFactory {
  Controller controller;
  PageFactory(this.controller);

  Widget createWelcomeScreen() {
    return WelcomeScreen(controller);
  }

  Widget createLoginPage() {
    return Login(controller);
  }

  Widget createRegisterPage() {
    return Register(controller);
  }

  Widget createUserStartPage() {
    return UserStartPage(controller);
  }
}
