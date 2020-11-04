//import 'dart:html';

import 'package:confnect/view/AppRouter.dart';
import 'package:confnect/view/PageFactory.dart';
import 'package:flutter/material.dart';
import './model/AppModel.dart';
import './controller/Controller.dart';

void main() {
  AppModel model = AppModel("Confnect");
  Controller controller = Controller(model);
  controller.startApp(Confnect(PageFactory(controller)));
}

class Confnect extends StatelessWidget {
  final PageFactory pageFactory;
  Confnect(this.pageFactory);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confnect',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: pageFactory.getWelcomeScreen(),
      routes: {
        AppRouter.LOGIN: (_) => pageFactory.getLoginPage(),
        AppRouter.REGISTER: (_) => pageFactory.getRegisterPage(),
      },
    );
  }
}
