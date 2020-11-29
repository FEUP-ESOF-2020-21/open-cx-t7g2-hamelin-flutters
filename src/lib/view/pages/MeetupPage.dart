import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Posts/Comments/AddComent.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentList.dart';
import 'package:flutter/material.dart';

class MeetupPage extends StatefulPage {
  Meetup _meetup;
  Controller _controller;
  MeetupPage(this._controller, this._meetup) : super(_controller);

  @override
  _MeetupPageState createState() => _MeetupPageState();
}

class _MeetupPageState extends State<MeetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meetup"),
      ),
      body: Column(
        children: [
          Text(widget._meetup.getDescription()),
          Container(
            child: CommentList(widget._meetup.getComments()),
          ),
          /*Align(
            alignment: Alignment.bottomCenter,
            child: AddComment(
                widget._controller, widget._meetup.getComments()),
          )*/
        ],
      ),
    );
  }
}
