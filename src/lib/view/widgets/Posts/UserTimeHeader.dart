import 'package:confnect/model/Date.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/User/AvatarImg.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserTimeHeader extends StatefulWidget {
  final User _user;
  final Date _date;
  final double _height;
  final double fontSize;
  final Widget beforeImage;
  final Widget beforeDate;

  UserTimeHeader(this._user, this._date, this._height,
      {this.fontSize = 13, this.beforeImage, this.beforeDate});
  @override
  _UserTimeHeaderState createState() => _UserTimeHeaderState();
}

class _UserTimeHeaderState extends State<UserTimeHeader> {
  @override
  Widget build(BuildContext context) {
    Widget beforeImage =
        widget.beforeImage == null ? Container() : widget.beforeImage;
    Widget beforeDate =
        widget.beforeDate == null ? Container() : widget.beforeDate;
    return Container(
      height: widget._height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              beforeImage,
              AvatarImg(widget._user),
              Text(
                widget._user.getFullName(),
                style: TextStyle(fontSize: widget.fontSize),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                beforeDate,
                Text(widget._date.getMinutesSince()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
