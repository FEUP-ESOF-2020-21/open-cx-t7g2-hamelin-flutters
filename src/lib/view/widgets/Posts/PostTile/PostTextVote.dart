import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/pages/CreateMeetupPage.dart';
import 'package:confnect/view/pages/MeetupPage.dart';
import 'package:confnect/view/widgets/Meetup/MeetupBox.dart';
import 'package:confnect/view/widgets/Posts/UserTimeMeetHeader.dart';
import 'package:flutter/material.dart';

import 'VoteComment.dart';

// ignore: must_be_immutable
class PostTextVote extends StatefulWidget {
  Controller _controller;
  Post _post;
  PostTextVote(this._post, this._controller);
  @override
  _PostTextVoteState createState() => _PostTextVoteState();
}

class _PostTextVoteState extends State<PostTextVote> {
  openCreateMeetupPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CreateMeetupPage(widget._controller, widget._post, () {
                setState(() {});
              })),
    );
  }

  openMeetupPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              MeetupPage(widget._controller, widget._post.getMeetup())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          UserTimeMeetHeader(
              widget._post.getAuthor(), widget._post.getDate(), 20,
              onMeetupSelected: () {
            if (widget._post.getMeetup() == null) {
              this.openCreateMeetupPage();
            } else {
              openMeetupPage();
            }
          }),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(widget._post.getDescription()),
          ),
          VoteComment(widget._post),
          if (widget._post.getMeetup() != null)
            MeetupBox(widget._controller, widget._post.getMeetup()),
        ],
      ),
    );
  }
}
