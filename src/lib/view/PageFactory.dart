import 'package:confnect/view/pages/WelcomeScreen.dart';

import '../controller/Controller.dart';
import './pages/Register.dart';
import './pages/Login.dart';

class PageFactory {
  Controller controller;
  PageFactory(this.controller);

  getWelcomeScreen() {
    return WelcomeScreen(controller);
  }

  getLoginPage() {
    return Login(controller);
  }

  getRegisterPage() {
    return Register(controller);
  }
}
