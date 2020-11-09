import 'package:confnect/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarImg extends StatelessWidget {
  final User _user;

  AvatarImg(this._user);

  @override
  Widget build(BuildContext context) {
    final avatar = _user.getAvatarUrl() == null || _user.getAvatarUrl().isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(backgroundImage: NetworkImage(_user.getAvatarUrl()));
    return avatar;
  }
}
