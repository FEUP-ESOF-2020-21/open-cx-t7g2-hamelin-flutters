import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SquareButton.dart';

class ProfileForumListTile extends StatelessWidget {
  final String text;
  final double margin;

  ProfileForumListTile(this.text, this.margin);

  @override
  Widget build(BuildContext context) {
    //final Users users = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: this.margin),
        SquareButton(this.text, () {
        }),
      ],
    );
  }
}