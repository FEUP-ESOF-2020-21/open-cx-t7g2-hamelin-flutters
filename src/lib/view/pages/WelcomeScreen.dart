import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/AppModel.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/SquareButton.dart';

import '../AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    AppModel model = super.getController().getModel();

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  top: 60,
                  left: 30.0,
                ),
                child: Text(model.getAppName(),
                    textScaleFactor: 2.5,
                    style: GoogleFonts.lora(fontWeight: FontWeight.w600))),
            Spacer(),
            FormFieldContainer(
              SquareButton('Login', () {
                Navigator.pushNamed(context, AppRouter.LOGIN);
              }),
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
