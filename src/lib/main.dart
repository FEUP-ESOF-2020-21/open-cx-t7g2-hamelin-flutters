//import 'dart:html';

import 'package:confnect/controller/database/MockAdapter.dart';
import 'package:confnect/view/AppRouter.dart';
import 'package:confnect/view/PageFactory.dart';
import 'package:flutter/material.dart';
import './controller/Controller.dart';

void main() {
  Controller controller = Controller(MockAdapter());
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
      //home: pageFactory.createWelcomeScreen(),
      home: pageFactory.createTestPage(),
      routes: {
        AppRouter.LOGIN: (_) => pageFactory.createLoginPage(),
        AppRouter.REGISTER: (_) => pageFactory.createRegisterPage(),
      },
    );
  }
}
