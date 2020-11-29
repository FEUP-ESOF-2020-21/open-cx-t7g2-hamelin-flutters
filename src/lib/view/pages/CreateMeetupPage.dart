import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/Page.dart';
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
        "Lorem Ipsum ",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on),
              Text(meetup.getLocation()),
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time),
              Text(meetup.getDate().getFormmatedDate()),
            ],
          ),
          Text(meetup.getDescription()),
        ],
      ),
    );
  }
}
