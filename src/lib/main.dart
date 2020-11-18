//import 'dart:html';

import 'package:confnect/controller/database/MockAdapter.dart';
import 'package:confnect/view/AppRouter.dart';
import 'package:confnect/view/PageFactory.dart';
import 'package:confnect/view/style/TextStyle.dart';
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
          textTheme: TextTheme(
            headline6: titleTextStyle,
            bodyText1: bodyTextStyle1,
            bodyText2: bodyTextStyle2,
          )),
      home: pageFactory.createHomePage(),
      routes: {
        AppRouter.LOGIN: (_) => pageFactory.createLoginPage(),
        AppRouter.REGISTER: (_) => pageFactory.createRegisterPage(),
      },
    );
  }
}
