import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProfileForumListTile.dart';

class ProfileForumList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Forums',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold)),
        ProfileForumListTile('AI', 10.0),
        ProfileForumListTile('Data Science', 10.0),
        ProfileForumListTile('Quantom Computers', 10.0),
      ],
    );
  }
}
