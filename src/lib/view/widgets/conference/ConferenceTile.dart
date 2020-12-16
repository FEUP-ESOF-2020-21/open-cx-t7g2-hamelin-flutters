import 'package:confnect/model/Conference.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class ConferenceTile extends StatelessWidget {
  final Conference _conference;
  final Function _viewConference;
  final bool showDescription, showTags;
  const ConferenceTile(this._conference, this._viewConference,
      {this.showDescription = true, this.showTags = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          _viewConference(
              _conference); // this will push the forum page on the navigator
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_conference.getImageUrl()),
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
                      _conference.getName(),
                      style: forumTitleStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(_conference.getLocation(),
                          style: talkSpeakerTextStyle),
                    ),
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
                              _conference.getDescription(),
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
