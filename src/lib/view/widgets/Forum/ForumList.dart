import 'package:confnect/controller/database/MockAdapter.dart';
import 'package:confnect/view/widgets/Forum/ForumTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForumList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    return ListView(
      children: [ForumTile(MockAdapter.getForums()[0])],
    );
  }
}
