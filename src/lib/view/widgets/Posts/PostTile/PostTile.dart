import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/AppRouter.dart';
import 'package:confnect/view/pages/PostPage.dart';
import 'package:confnect/view/widgets/Posts/PostTile/TextSectionPost.dart';
import 'package:confnect/view/widgets/Posts/PostTile/VoteComment.dart';
import 'package:confnect/view/widgets/User/avatar.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post _post; // = new Post("Ademar", "Ensinando flutter", "lorem ipsum");
  final Controller _controller;

  const PostTile(this._post, this._controller);

  @override
  Widget build(BuildContext context) {
    void _postPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostPage(_controller)),
      );
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: _postPage,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: AvatarImg(_post.getAuthor()),
                padding: EdgeInsets.all(10.0),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                //padding: EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    TextSectionPost(_post.getTitle(), _post.getDescription()),
                    VoteComment(_post),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
