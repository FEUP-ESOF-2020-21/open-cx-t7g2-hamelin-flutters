import 'package:confnect/controller/database/MockAdapter.dart';
import './ForumTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForumList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    return ListView(children: forums());
  }

  List<ForumTile> forums() {
    return MockAdapter.getForums().map((forum) => ForumTile(forum)).toList();
  }
}
