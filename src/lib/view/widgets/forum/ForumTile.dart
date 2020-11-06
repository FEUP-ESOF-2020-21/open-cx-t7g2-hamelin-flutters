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

    return Center(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: avatar,
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              //color: Colors.green,
              padding: EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all((5.0)),
                    child: Text(
                      forum.getTitle(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    forum.getDescription(),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_upward),
                          color: Colors.orange,
                          onPressed: () {}),
                      IconButton(
                        icon: Icon(Icons.arrow_downward),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.comment),
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    /*return ListTile(
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
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );*/
  }
}
