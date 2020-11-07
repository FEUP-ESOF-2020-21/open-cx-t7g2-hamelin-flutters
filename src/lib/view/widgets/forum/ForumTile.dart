import 'package:confnect/model/Forum.dart';
import 'package:confnect/view/widgets/User/avatar.dart';
import 'package:flutter/material.dart';

class ForumTile extends StatelessWidget {
  final Forum
      forum; // = new Forum("Ademar", "Ensinando flutter", "lorem ipsum");

  const ForumTile(this.forum);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarImg(forum.getAuthor()),
      title: Text(forum.getTitle()),
      subtitle: Text("Comments"),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
