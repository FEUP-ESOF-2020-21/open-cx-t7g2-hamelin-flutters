import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Talk.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Page.dart';

class AdminTalkTile extends StatelessPage {
  final Talk _talk;
  AdminTalkTile(Controller controller, this._talk, {Key key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          print("Edit talk!");
          //_editTalk(
          //_talk.getId()); // this will push the forum page on the navigator
        },
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                _talk.getDescription(),
                                style: forumTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                          print("Edit talk");
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text(
                                  "Delete talk",
                                  textScaleFactor: 1.3,
                                ),
                                content: new Text(
                                    "Are you sure you want to delete '" +
                                        _talk.getTitle() +
                                        "'?"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Yes"),
                                    onPressed: () {
                                      print("Delete talk!");
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text("No!"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
