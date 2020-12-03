import 'package:confnect/model/Date.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/User/AvatarImg.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserTimeHeader extends StatefulWidget {
  final User _user;
  Date _date;
  double _height;
  double fontSize;

  UserTimeHeader(this._user, this._date, this._height, {this.fontSize = 13});
  @override
  _UserTimeHeaderState createState() => _UserTimeHeaderState();
}

class _UserTimeHeaderState extends State<UserTimeHeader> {
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
              Text(
                widget._user.getFullName(),
                style: TextStyle(fontSize: widget.fontSize),
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
