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
  _RegisterState createState() => _RegisterState(getController());
}

class _RegisterState extends State<Register> {
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final Controller _controller;
  _RegisterState(this._controller);

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
              SquareButton('Register', () {
                String fullname = fullNameController.text,
                    username = usernameController.text,
                    password = passwordController.text;
                if (_controller
                        .getDatabase()
                        .register(fullname, username, password) ==
                    1) {
                  Navigator.popAndPushNamed(context, AppRouter.USER_START_PAGE);
                } else {
                  //empty values
                  if (_controller
                          .getDatabase()
                          .register(fullname, username, password) ==
                      0) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("Register error"),
                          content: new Text("You must fill in all fields!"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  //username already exists
                  else if (_controller
                          .getDatabase()
                          .register(fullname, username, password) ==
                      2) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("Register error"),
                          content: new Text("Username already exists!"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              }),
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
