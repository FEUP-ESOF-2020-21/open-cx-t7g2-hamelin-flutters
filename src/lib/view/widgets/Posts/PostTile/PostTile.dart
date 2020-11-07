import 'package:confnect/model/Post.dart';
import 'package:confnect/view/widgets/Posts/PostTile/VoteComment.dart';
import 'package:confnect/view/widgets/User/avatar.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post; // = new Post("Ademar", "Ensinando flutter", "lorem ipsum");

  const PostTile(this.post);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: AvatarImg(post.getAuthor()),
                padding: EdgeInsets.all(10.0),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                //padding: EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Container(
                      //padding: EdgeInsets.all((5.0)),
                      child: Text(
                        post.getTitle(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      post.getDescription(),
                    ),
                    VoteComment()
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
