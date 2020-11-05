import 'package:confnect/view/widgets/forum/ForumList.dart';
import 'package:flutter/material.dart';

class Forums extends StatefulWidget {
  Forums({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = "Forums";

  @override
  _ForumsState createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {
  @override
  Widget build(BuildContext context) {
    return ForumList();
    /*body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "ZAS",
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              child: ForumList(),
              //color: Colors.cyan,
            ),
          ],
        ),
      ),*/
    /*floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/
  }
}
