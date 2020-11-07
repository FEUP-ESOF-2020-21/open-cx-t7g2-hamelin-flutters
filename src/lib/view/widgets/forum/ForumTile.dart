import 'package:confnect/model/Forum.dart';
import 'package:confnect/view/style/DescriptionTextWidget.dart';
import 'package:confnect/view/widgets/Posts/PostTile/TextSectionPost.dart';

import 'package:confnect/view/widgets/User/avatar.dart';
import 'package:flutter/material.dart';

class ForumTile extends StatelessWidget {
  final Forum
      _forum; // = new Forum("Ademar", "Ensinando flutter", "lorem ipsum");

  const ForumTile(this._forum);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(20),
              //color: Colors.grey,
              child: Center(
                child: Text(
                  _forum.getTitle(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: AvatarImg(_forum.getAuthor()),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(_forum.getDescription()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
