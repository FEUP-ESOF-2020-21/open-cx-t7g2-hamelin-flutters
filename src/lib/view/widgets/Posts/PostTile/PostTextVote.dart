import 'package:confnect/model/Post.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/Meetup/MeetupBox.dart';
import 'package:confnect/view/widgets/Posts/UserTimeMeetHeader.dart';
import 'package:flutter/material.dart';

import 'VoteComment.dart';

class PostTextVote extends StatefulWidget {
  final Post _post;
  PostTextVote(this._post);
  @override
  _PostTextVoteState createState() => _PostTextVoteState();
}

class _PostTextVoteState extends State<PostTextVote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          UserTimeMeetHeader(
            widget._post.getAuthor(),
            widget._post.getDate(),
            20,
            onMeetupSelected: () {
              setState(() {
                widget._post.isMeetingUp = true;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(widget._post.getDescription()),
          ),
          VoteComment(widget._post),
          if (widget._post.isMeetingUp) MeetupBox(),
        ],
      ),
    );
  }
}
