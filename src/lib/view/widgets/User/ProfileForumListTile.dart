import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SquareButton.dart';

class ProfileForumListTile extends StatelessWidget {
  final String text;
  final double margin;

  ProfileForumListTile(this.text, this.margin);

  @override
  Widget build(BuildContext context) {
    //TODO make clickable and redirect to forum page
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: this.margin),
        SquareButton(this.text, () {}),
      ],
    );
  }
}
