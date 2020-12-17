import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/meetup/MeetupButton.dart';
import 'package:confnect/view/widgets/user/AvatarImg.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserTimeMeetHeader extends StatefulWidget {
  User _user;
  Date _date;
  double _height;
  Post _post;
  Controller _controller;
  final VoidCallback onMeetupSelected;

  UserTimeMeetHeader(
      this._user, this._date, this._height, this._post, this._controller,
      {this.onMeetupSelected});
  @override
  UserTimeMeetHeaderState createState() => UserTimeMeetHeaderState();
}

class UserTimeMeetHeaderState extends State<UserTimeMeetHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              AvatarImg(widget._user),
              Text(widget._user.getFullName()),
            ],
          ),
          Container(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  widget._controller
                                  .getDatabase()
                                  .getForum(widget._post.getForumId())
                                  .getSpeaker() !=
                              null &&
                          widget._post.getAuthor().getUsername() ==
                              widget._controller
                                  .getDatabase()
                                  .getForum(widget._post.getForumId())
                                  .getSpeaker()
                                  .getUsername()
                      ? Container(
                          width: 45,
                          padding: EdgeInsets.only(
                            right: 2,
                            left: 2,
                          ),
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            'Host',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      : Container(),
                  Container(
                      margin: EdgeInsets.only(right: 5),
                      child: MeetupButton(
                        onButtonSelected: () => widget.onMeetupSelected(),
                      )),
                  Text(widget._date.getMinutesSince()),
                ],
              ))
        ],
      ),
    );
  }
}
