//import 'dart:html';

import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/MockAdapter.dart';
import 'package:confnect/view/pages/PostPage.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

void main() {
  Controller controller = Controller(MockAdapter());
  controller.startApp(ConfnectTest(controller));
}

// ignore: must_be_immutable
class ConfnectTest extends StatelessWidget {
  Controller controller;
  ConfnectTest(this.controller);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConfnectTest',
      theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: TextTheme(
            headline6: titleTextStyle,
            bodyText1: bodyTextStyle1,
            bodyText2: bodyTextStyle2,
          )),
      home: PostPage(
        controller,
        controller.getDatabase().getPosts(controller
            .getDatabase()
            .getConferences(this.controller.getLoggedInUser())[0])[0],
      ),
      //home: pageFactory.createUserPage(),
    );
  }
}
