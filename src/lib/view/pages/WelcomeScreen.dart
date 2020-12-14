import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:confnect/view/widgets/PageTitle.dart';
import '../../controller/database/Database.dart';

import '../AppRouter.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessPage {
  WelcomeScreen(Controller controller, {Key key}) : super(controller, key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    Database db = super.getController().getDatabase();

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            PageTitle(db.getAppName()),
            Spacer(),
            FormFieldContainer(
              SquareButton(
                'Login',
                () {
                  Navigator.pushNamed(context, AppRouter.LOGIN);
                },
                key: Key("loginWelcome"),
              ),
            ),
            FormFieldContainer(
              SquareButton('Register', () {
                Navigator.pushNamed(context, AppRouter.REGISTER);
              }),
              margin: EdgeInsets.only(bottom: 30),
            ),
          ],
        ),
      ),
    );
  }
}
