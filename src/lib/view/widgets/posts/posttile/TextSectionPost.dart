import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/style/DescriptionTextWidget.dart';
import 'package:flutter/material.dart';

class TextSectionPost extends StatelessWidget {
  final String _title;
  final String _description;
  final bool _showMore;
  final Controller _controller;
  final Post _post;
  TextSectionPost(this._title, this._description, this._showMore,
      this._controller, this._post);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    _title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              _controller
                              .getDatabase()
                              .getForum(_post.getForumId())
                              .getSpeaker() !=
                          null &&
                      _post.getAuthor().getUsername() ==
                          _controller
                              .getDatabase()
                              .getForum(_post.getForumId())
                              .getSpeaker()
                              .getUsername()
                  ? Container(
                      width: 45,
                      padding: EdgeInsets.only(
                        right: 2,
                        left: 2,
                      ),
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        'Host',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        (_showMore
            ? DescriptionTextWidget(text: _description)
            : Text(_description)),
      ],
    );
  }
}
