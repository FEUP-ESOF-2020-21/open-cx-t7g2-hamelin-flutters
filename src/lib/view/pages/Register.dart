import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
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
  final _formKey = GlobalKey<FormState>();
  final Controller _controller;
  _RegisterState(this._controller);

  @override
  Widget build(BuildContext context) {
    Database db = _controller.getDatabase();
    return Scaffold(
      body: ListView(
        children: [
          GoBackButton(),
          Spacer(
            flex: 1,
          ),
          PageTitle(
            "Register",
            margin: EdgeInsets.only(
              top: 20,
              left: 30.0,
              bottom: 30,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormFieldContainer(
                  FormTextField('Full Name', fullNameController,
                      validator: ValidatorFactory.getValidator('Full name',
                          fieldRequired: true)),
                ),
                FormFieldContainer(
                  FormTextField('Username', usernameController,
                      validator: ValidatorFactory.getValidator('Full name',
                          fieldRequired: true)),
                ),
                FormFieldContainer(
                  FormTextField('Password', passwordController,
                      obscureText: true,
                      validator: ValidatorFactory.getValidator('Full name',
                          fieldRequired: true)),
                  margin: EdgeInsets.only(
                    bottom: 30,
                  ),
                ),
                FormFieldContainer(
                  SquareButton('Register', () {
                    String fullname = fullNameController.text,
                        username = usernameController.text,
                        password = passwordController.text;
                    if (db.register(fullname, username, password) == 1) {
                      _controller.setLoggedInUserName(username);
                      Navigator.popUntil(context,
                          ModalRoute.withName(Navigator.defaultRouteName));
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Register"),
                            content: new Text("You've been registered!"),
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
                    } else {
                      //empty values
                      if (db.register(fullname, username, password) == 0) {
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
                      else if (db.register(fullname, username, password) == 2) {
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
                )
              ],
            ),
          ),
          StandardDivider(),
          TextOnlyButton(
            () {
              Navigator.popAndPushNamed(context, AppRouter.LOGIN);
            },
            text: "Already have an account? Click Here!",
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
