import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Meetup/MeetupInfo.dart';
import 'package:confnect/view/widgets/Posts/Comments/AddComent.dart';
import 'package:confnect/view/widgets/Posts/Comments/CommentList.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
      body: Stack(children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 70),
          child: ListView(
            children: [
              MeetupInfo(widget._meetup),
              Divider(),
              CommentList(widget._meetup.getComments(), widget._controller),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AddComment(
            widget._controller,
            widget._meetup.getComments(),
            onSubmitted: (user, date, text) {
              setState(() {
                widget._meetup.getComments().add(new Comment(user, date, text));
              });
            },
          ),
        )
      ]),
    );
  }
}
