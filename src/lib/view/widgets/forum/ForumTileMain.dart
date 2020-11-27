import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Forum.dart';
import 'package:confnect/view/pages/ForumPage.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:flutter/material.dart';

class ForumTileMain extends StatelessWidget {
  final Forum _forum;
  Controller _controller;
  Function _refreshState;
  ForumTileMain(this._forum, this._controller, this._refreshState);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                this._controller.setCurrentForumId(_forum.getId());
                _refreshState();
              },
              child: Column(
                children: [
                  Container(
                    height: 75,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          _forum.getImageURL(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _forum.getTitle(),
                      style: titleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )));
  }
}
