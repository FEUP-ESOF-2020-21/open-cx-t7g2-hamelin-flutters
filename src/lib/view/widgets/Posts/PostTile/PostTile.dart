import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/pages/PostPage.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostContent.dart';
import 'package:flutter/material.dart';

class PostTile extends StatefulWidget {
  final Post _post; // = new Post("Ademar", "Ensinando flutter", "lorem ipsum");
  final Controller _controller;
  final User host;
  final bool showForum;

  const PostTile(this._post, this._controller,
      {this.host, this.showForum = false});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
    void _postPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostPage(
                  this.widget._controller,
                  this.widget._post,
                  () {
                    setState(() {});
                  },
                  host: this.widget.host,
                )),
      );
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
          onTap: _postPage,
          child: PostContent(widget._controller, widget._post, true, () {
            setState(() {});
          }, showForum: widget.showForum)),
    );
  }
}
