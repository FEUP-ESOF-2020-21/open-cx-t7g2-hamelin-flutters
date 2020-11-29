import 'package:confnect/model/Date.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/Meetup/MeetupButton.dart';
import 'package:confnect/view/widgets/User/AvatarImg.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserTimeMeetHeader extends StatefulWidget {
  final User _user;
  Date _date;
  double _height;

  UserTimeMeetHeader(this._user, this._date, this._height);
  @override
  _UserTimeMeetHeaderState createState() => _UserTimeMeetHeaderState();
}

class _UserTimeMeetHeaderState extends State<UserTimeMeetHeader> {
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
                  Container(
                      margin: EdgeInsets.only(right: 5),
                      child: MeetupButton(widget._height)),
                  Text(widget._date.getMinutesSince()),
                ],
              ))
        ],
      ),
    );
  }
}
