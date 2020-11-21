import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Forum.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/User/AvatarImg.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserTimeHeaderForum extends StatefulWidget {
  final User _user;
  Date _date;
  double _height;
  Forum _forum;

  UserTimeHeaderForum(this._user, this._date, this._height, this._forum);
  @override
  _UserTimeHeaderForumState createState() => _UserTimeHeaderForumState();
}

class _UserTimeHeaderForumState extends State<UserTimeHeaderForum> {
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
              Row(
                children: [
                  AvatarImg(widget._user),
                  Text(
                    widget._user.getFullName(),
                  ),
                ],
              ),
              Icon(Icons.arrow_right),
              Text(
                widget._forum.getTitle(),
                overflow: TextOverflow.visible,
              )
            ],
          ),
          Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(widget._date.getMinutesSince()))
        ],
      ),
    );
  }
}
