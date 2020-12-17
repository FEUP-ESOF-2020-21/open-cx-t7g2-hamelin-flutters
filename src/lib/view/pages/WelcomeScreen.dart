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

    return Stack(
      children: <Widget>[
        Image(
          image: NetworkImage(
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.unicef.org.uk%2Fbabyfriendly%2Fwp-content%2Fuploads%2Fsites%2F2%2F2018%2F03%2F2000x1000-Conference-2016.jpg&f=1&nofb=1"),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Color.fromARGB(130, 0, 0, 0),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[
                Spacer(
                  flex: 5,
                ),
                PageTitle(
                  db.getAppName(),
                  white: true,
                  scaleFactor: 2.3,
                  margin: EdgeInsets.only(bottom: 30),
                  dontAlign: true,
                ),
                Expanded(
                  child: Text(
                    db.getAppDescription(),
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.4,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                FormFieldContainer(
                  SquareButton('Login', () {
                    Navigator.pushNamed(context, AppRouter.LOGIN);
                  }, white: true),
                  key: Key("loginWelcome"),
                ),
                FormFieldContainer(
                  SquareButton('Register', () {
                    Navigator.pushNamed(context, AppRouter.REGISTER);
                  }, white: true),
                  margin: EdgeInsets.only(bottom: 30),
                  key: Key("registerWelcome"),
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
