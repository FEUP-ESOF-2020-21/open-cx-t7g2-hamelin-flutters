import 'package:confnect/model/forums/Forum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SquareButton.dart';

class ProfileForumListTile extends StatelessWidget {
  final Forum _forum;
  final Function _refreshState;
  final double margin;

  ProfileForumListTile(this._forum, this._refreshState, this.margin);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: this.margin),
        SquareButton(
          this._forum.getTitle(),
          () {
            this._refreshState(this
                ._forum
                .getId()); // this will push the forum page on the navigator
          },
        ),
      ],
    );
  }
}
