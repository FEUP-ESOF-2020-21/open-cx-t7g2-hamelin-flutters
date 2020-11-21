import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatefulPage {
  Controller _controller;
  MainPage(this._controller) : super(_controller);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
