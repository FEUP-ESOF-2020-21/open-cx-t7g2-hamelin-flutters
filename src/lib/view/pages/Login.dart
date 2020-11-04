import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:confnect/view/widgets/PageTitle.dart';
import 'package:confnect/view/widgets/GoBackButton.dart';
import 'package:confnect/view/widgets/TextOnlyButton.dart';
import 'package:confnect/view/widgets/StandardDivider.dart';

import '../AppRouter.dart';
import '../Page.dart';
import '../../controller/Controller.dart';
import 'package:flutter/material.dart';
import '../widgets/SquareButton.dart';

class Login extends StatefulPage {
  Login(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            GoBackButton(),
            PageTitle(
              "Login",
              margin: EdgeInsets.only(
                top: 20,
                left: 30.0,
                bottom: 30,
              ),
            ),
            FormFieldContainer(
              FormTextField('Username'),
            ),
            FormFieldContainer(
              FormTextField('Password', obscureText: true),
            ),
            FormFieldContainer(SquareButton('Login', () {}),
                margin: EdgeInsets.only(bottom: 30)),
            StandardDivider(),
            TextOnlyButton(
              "Don't have an account? Click Here!",
              () {
                Navigator.popAndPushNamed(context, AppRouter.REGISTER);
              },
            ),
          ],
        ),
      ),
    );
  }
}
