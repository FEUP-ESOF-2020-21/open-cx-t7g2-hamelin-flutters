import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/model/forums/TalkForum.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class ForumTile extends StatefulWidget {
  final Forum _forum;
  final Function _onTapAction;
  final bool showDescription, showTags;
  final bool admin;
  ForumTile(this._forum, this._onTapAction,
      {this.showDescription = true,
      this.showTags = true,
      this.admin = false,
      Key key})
      : super(key: key);

  @override
  State<ForumTile> createState() {
    return _ForumTileState(_forum, _onTapAction,
        showDescription: showDescription, showTags: showTags, admin: admin);
  }
}

class _ForumTileState extends State<ForumTile> {
  final Forum _forum;
  final Function _onTapAction;
  final bool showDescription, showTags;
  final bool admin;
  bool selected = false;

  _ForumTileState(this._forum, this._onTapAction,
      {this.showDescription = true, this.showTags = true, this.admin = false});

  @override
  Widget build(BuildContext context) {
    bool talkForum = _forum is TalkForum;
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          print(admin);
          if (!this.admin)
            _onTapAction(_forum
                .getId()); // this will push the forum page on the navigator
          else {
            print("Changed selection");
            selected = !selected;
            setState(() {});
          }
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: getDecoration(selected, _forum),
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
                          children: showTags
                              ? [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                          _forum.getTagsNames().join(', '),
                                          style: talkSpeakerTextStyle),
                                    ),
                                  ),
                                ]
                              : [],
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
                children: showDescription
                    ? [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              _forum.getDescription(),
                              style: forumTextStyle,
                            ),
                          ),
                        ),
                      ]
                    : [],
              )
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration getDecoration(bool selected, Forum _forum) {
  if (selected) {
    print("This one");
    return BoxDecoration(
      border: Border.all(color: Colors.green, width: 10),
      image: DecorationImage(
        image: NetworkImage(_forum.getImageURL()),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.srcOver,
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  } else {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(_forum.getImageURL()),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.srcOver,
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }
}
