import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/widgets/user/AvatarImg.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserTimeHeaderForum extends StatefulWidget {
  final User _user;
  Date _date;
  double _height;
  Forum _forum;
  Controller _controller;
  Function _refreshState;

  UserTimeHeaderForum(this._user, this._date, this._height, this._forum,
      this._controller, this._refreshState);
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
              InkWell(
                onTap: () {
                  widget._controller.setCurrentForumId(widget._forum.getId());
                  widget._refreshState();
                },
                child: Container(
                  width: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      widget._forum.getTitle(),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
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
