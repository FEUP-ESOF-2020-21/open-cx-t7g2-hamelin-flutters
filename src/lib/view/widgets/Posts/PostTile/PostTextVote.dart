import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
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

  bool userInDiscussion() {
    for (Comment comment in widget._post.getComments()) {
      if (widget._controller.getLoggedInUser() == comment.getAuthor())
        return true;
    }
    return false;
  }

  cancelMeetup() {
    setState(() {});
    setState(() {
      widget._post.setMeetup(null);
    });
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
              if (userInDiscussion())
                this.openCreateMeetupPage();
              else
                _showMyDialog();
            } else {
              openMeetupPage();
            }
          }),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(widget._post.getDescription()),
          ),
          VoteComment(widget._post, widget._controller),
          if (widget._post.getMeetup() != null)
            MeetupBox(widget._controller, widget._post.getMeetup(), () {
              cancelMeetup();
            }),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attention!'),
          content: Text(
              "You have to participate in the discussion to create the meeting!"),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
