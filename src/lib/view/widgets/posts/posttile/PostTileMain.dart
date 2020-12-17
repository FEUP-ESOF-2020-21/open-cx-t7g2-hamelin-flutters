import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/pages/PostPage.dart';
import 'package:confnect/view/widgets/posts/UserTimeHeaderForum.dart';

import 'package:flutter/material.dart';

import 'VoteComment.dart';

class PostTileMain extends StatefulWidget {
  final Post _post; // = new Post("Ademar", "Ensinando flutter", "lorem ipsum");
  final Controller _controller;
  final Function _refreshState;

  const PostTileMain(this._post, this._controller, this._refreshState);

  @override
  _PostTileMainState createState() => _PostTileMainState();
}

class _PostTileMainState extends State<PostTileMain> {
  refreshBoth() {
    widget._refreshState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void _postPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostPage(
                  widget._controller,
                  this.widget._post,
                  () {
                    refreshBoth();
                  },
                  host: widget._controller
                      .getDatabase()
                      .getForum(widget._post.getForumId())
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserTimeHeaderForum(
                    widget._post.getAuthor(),
                    widget._post.getDate(),
                    20,
                    widget._controller
                        .getDatabase()
                        .getForum(widget._post.getForumId()),
                    widget._controller,
                    widget._refreshState),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(widget._post.getDescription()),
                ),
                VoteComment(widget._post, widget._controller, () {
                  setState(() {});
                }),
              ],
            )),
      ),
    );
  }
}
