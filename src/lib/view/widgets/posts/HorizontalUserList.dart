// ignore: must_be_immutable
import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/pages/ProfilePage.dart';
import 'package:confnect/view/widgets/user/UserTile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HorizontalUserList extends StatefulWidget {
  final Controller _controller;
  final Function _refreshState;
  List<User> usersList;

  HorizontalUserList(this._controller, this._refreshState, this.usersList);

  @override
  _HorizontalUserListState createState() => _HorizontalUserListState();
}

class _HorizontalUserListState extends State<HorizontalUserList> {
  List<dynamic> users() {
    if (this.widget.usersList.isEmpty) {
      this.widget.usersList = widget._controller.getDatabase().getUsers();
    }
    return this
        .widget
        .usersList
        .map((user) => UserTile(user, (userToSee) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                        widget._controller, widget._refreshState,
                        user: userToSee)),
              );
            }))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: ListView(scrollDirection: Axis.horizontal, children: users()));
  }
}
