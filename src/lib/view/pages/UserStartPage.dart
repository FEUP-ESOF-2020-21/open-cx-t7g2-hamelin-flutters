import 'package:flutter/material.dart';
import '../widgets/PageTitle.dart';
import '../Page.dart';
import '../../controller/Controller.dart';

class UserStartPage extends StatelessPage {
  UserStartPage(Controller controller, {Key key}) : super(controller, key: key);

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            PageTitle("User Page"),
          ],
        ),
      ),
    );
  }
}
