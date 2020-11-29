import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/Meetup/MeetupInfo.dart';
import 'package:flutter/material.dart';

class CreateMeetupPage extends StatefulPage {
  Post _post;
  Controller _controller;
  CreateMeetupPage(this._controller, this._post) : super(_controller);

  @override
  _CreateMeetupPageState createState() => _CreateMeetupPageState();
}

class _CreateMeetupPageState extends State<CreateMeetupPage> {
  void createMeetup() {
    widget._post.createMeetup(
        new Date(new DateTime.now()),
        "Kitchen",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra",
        widget._controller
            .getDatabase()
            .getUser(widget._controller.getLoggedInUserName()));
  }

  @override
  Widget build(BuildContext context) {
    createMeetup();
    Meetup meetup = widget._post.getMeetup();
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Meetup"),
      ),
      body: MeetupInfo(meetup),
    );
  }
}
