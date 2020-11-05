import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:confnect/view/widgets/PageTitle.dart';
import 'package:confnect/view/widgets/GoBackButton.dart';
import 'package:confnect/view/widgets/TextOnlyButton.dart';
import 'package:confnect/view/widgets/StandardDivider.dart';

import '../AppRouter.dart';
import '../Page.dart';
import '../../controller/Controller.dart';
import 'package:flutter/material.dart';

class Register extends StatefulPage {
  Register(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            GoBackButton(),
            PageTitle(
              "Register",
              margin: EdgeInsets.only(
                top: 20,
                left: 30.0,
                bottom: 30,
              ),
            ),
            FormFieldContainer(
              FormTextField('Full Name', fullNameController),
            ),
            FormFieldContainer(
              FormTextField('Username', usernameController),
            ),
            FormFieldContainer(
              FormTextField('Password', passwordController, obscureText: true),
              margin: EdgeInsets.only(
                bottom: 30,
              ),
            ),
            FormFieldContainer(
              SquareButton('Register', () {}),
            ),
            StandardDivider(),
            TextOnlyButton(
              "Already have an account? Click Here!",
              () {
                Navigator.popAndPushNamed(context, AppRouter.LOGIN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
