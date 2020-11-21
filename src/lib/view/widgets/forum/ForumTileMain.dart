import 'package:confnect/model/Forum.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class ForumTileMain extends StatelessWidget {
  final Forum _forum;
  ForumTileMain(this._forum);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                Text(
                  _forum.getTitle(),
                  style: titleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
