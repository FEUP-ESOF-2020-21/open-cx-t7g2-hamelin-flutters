import 'package:confnect/model/Forum.dart';
import 'package:flutter/material.dart';

class ForumTile extends StatelessWidget {
  final Forum
      forum; // = new Forum("Ademar", "Ensinando flutter", "lorem ipsum");

  const ForumTile(this.forum);

  @override
  Widget build(BuildContext context) {
    /*final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));*/
    final avatar = CircleAvatar(
      child: Icon(Icons.person),
    );

    return ListTile(
      leading: avatar,
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
