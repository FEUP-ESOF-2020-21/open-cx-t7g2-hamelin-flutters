import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Talk.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

import '../../../Page.dart';
import '../../../style/TextStyle.dart';

class AdminTalkCodeTile extends StatelessPage {
  final Talk _talk;
  final Function _refreshState;
  final Controller _controller;
  AdminTalkCodeTile(this._controller, this._refreshState, this._talk, {Key key})
      : super(_controller, key: key);

  @override
  Widget build(BuildContext context) {
    Database db = super.getController().getDatabase();
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_talk.getImageURL()),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.srcOver,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _talk.getTitle(),
                              style: forumTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "by " + _talk.getSpeaker().getFullName(),
                              style: talkSpeakerTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
