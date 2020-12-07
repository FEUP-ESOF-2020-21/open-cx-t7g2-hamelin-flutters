import 'package:confnect/model/User.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User _user;
  final Function _viewUser;
  const UserTile(this._user, this._viewUser);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          _viewUser(_user); // this will push the forum page on the navigator
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_user.getAvatarUrl()),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.srcOver,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _user.getFullName(),
                    style: forumTitleStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
