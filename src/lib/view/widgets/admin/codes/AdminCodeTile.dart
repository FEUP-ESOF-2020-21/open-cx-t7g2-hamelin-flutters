import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Code.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/pages/admin/CodeForumList.dart';
import 'package:flutter/material.dart';

import '../../../Page.dart';
import '../../../style/TextStyle.dart';

class AdminCodeTile extends StatelessPage {
  final Code _code;
  // ignore: unused_field
  final Function _refreshState;
  final Controller _controller;
  AdminCodeTile(this._controller, this._refreshState, this._code, {Key key})
      : super(_controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CodeForumList(_controller, _code.getForums())),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_code.getConference().getImageUrl()),
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
                              _code.getCode(),
                              style: forumTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _code.getConference().getName(),
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
