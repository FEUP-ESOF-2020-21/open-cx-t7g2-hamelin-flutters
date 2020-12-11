import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/pages/PostPage.dart';
import 'package:confnect/view/widgets/Posts/UserTimeHeaderForum.dart';

import 'package:flutter/material.dart';

import 'VoteComment.dart';

class PostTileMain extends StatelessWidget {
  final Post _post; // = new Post("Ademar", "Ensinando flutter", "lorem ipsum");
  final Controller _controller;
  final Function _refreshState;

  const PostTileMain(this._post, this._controller, this._refreshState);

  @override
  Widget build(BuildContext context) {
    void _postPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostPage(
                  _controller,
                  this._post,
                  host: _controller
                      .getDatabase()
                      .getForum(_post.getForumId())
                      .getSpeaker(),
                )),
      );
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
            onTap: _postPage,
            child: Column(
              children: [
                UserTimeHeaderForum(
                    _post.getAuthor(),
                    _post.getDate(),
                    20,
                    _controller.getDatabase().getForum(_post.getForumId()),
                    _controller,
                    _refreshState),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(_post.getDescription()),
                ),
                VoteComment(_post, _controller),
              ],
            )),
      ),
    );
  }
}
