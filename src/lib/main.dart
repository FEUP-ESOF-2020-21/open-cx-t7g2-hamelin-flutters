//import 'dart:html';

import 'package:confnect/routes/pages.dart';
import 'package:confnect/views/LoginPage.dart';
import 'package:confnect/views/MyHomePage.dart';
import 'package:confnect/views/RegisterPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confnect',
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        AppRoutes.HOME: (_) => MyHomePage(title: 'Confnect'),
        AppRoutes.LOGIN_PAGE: (_) => LoginPage(),
        AppRoutes.REGISTER_PAGE: (_) => RegisterPage(),
      },
    );
  }
}
