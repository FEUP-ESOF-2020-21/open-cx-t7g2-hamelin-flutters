import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/model/forums/TalkForum.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class ForumTile extends StatelessWidget {
  final Forum _forum;
  final Function _viewForum;
  const ForumTile(this._forum, this._viewForum);

  @override
  Widget build(BuildContext context) {
    bool talkForum = _forum is TalkForum;
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          _viewForum(
              _forum.getId()); // this will push the forum page on the navigator
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_forum.getImageURL()),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.srcOver,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _forum.getTitle(),
                      style: forumTitleStyle,
                    ),
                  ),
                ],
              ),
              Column(
                children: talkForum
                    ? [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                    "A talk by " +
                                        _forum.getSpeaker().getFullName(),
                                    style: talkSpeakerTextStyle),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(_forum.getTagsNames().join(', '),
                                    style: talkSpeakerTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ]
                    : [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child:
                                    Text("TOPIC", style: talkSpeakerTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        _forum.getDescription(),
                        style: forumTextStyle,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
