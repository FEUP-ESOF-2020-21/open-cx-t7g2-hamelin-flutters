import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
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
  _LoginState createState() => _LoginState(getController());
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Controller _controller;
  _LoginState(this._controller);

  @override
  Widget build(BuildContext context) {
    Database db = _controller.getDatabase();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            GoBackButton(),
            Spacer(
              flex: 1,
            ),
            PageTitle(
              "Login",
              margin: EdgeInsets.only(
                left: 30.0,
                bottom: 30,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  FormFieldContainer(
                    FormTextField('Username', usernameController,
                        validator: ValidatorFactory.getValidator('Username',
                            fieldRequired: true)),
                    key: Key("usernameField"),
                  ),
                  FormFieldContainer(
                    FormTextField('Password', passwordController,
                        obscureText: true,
                        validator: ValidatorFactory.getValidator('Password',
                            fieldRequired: true)),
                    key: Key("passfield"),
                  ),
                  FormFieldContainer(
                      SquareButton(
                        'Login',
                        () {
                          String username = usernameController.text,
                              password = passwordController.text;
                          if (_formKey.currentState.validate()) {
                            if (db.login(username, password)) {
                              _controller.setLoggedInUserName(username);
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName));
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title: new Text("Wrong credentials"),
                                    content: new Text("Feels bad man"),
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
                        },
                        key: Key("LoginButton"),
                      ),
                      margin: EdgeInsets.only(bottom: 30))
                ])),
            StandardDivider(),
            TextOnlyButton(
              () {
                Navigator.popAndPushNamed(context, AppRouter.REGISTER);
              },
              text: "Don't have an account? Click Here!",
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
