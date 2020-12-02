import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class ForumTile extends StatelessWidget {
  final Forum
      _forum; // = new Forum("Ademar", "Ensinando flutter", "lorem ipsum");
  final Function _viewForum;
  const ForumTile(this._forum, this._viewForum);

  @override
  Widget build(BuildContext context) {
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
