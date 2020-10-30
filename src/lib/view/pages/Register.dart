import 'dart:ui';

import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';

import '../AppRouter.dart';
import '../Page.dart';
import '../../controller/Controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulPage {
  Register(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 50.0, left: 15.0, bottom: 100),
              child: IconButton(
                icon: Icon(Icons.keyboard_return),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                top: 20,
                left: 30.0,
                bottom: 30,
              ),
              child: Text("Register",
                  textScaleFactor: 2.5,
                  style: GoogleFonts.lora(fontWeight: FontWeight.w600)),
            ),
            FormFieldContainer(
              FormTextField('Full Name'),
            ),
            FormFieldContainer(
              FormTextField('Username'),
            ),
            FormFieldContainer(
              FormTextField('Password', obscureText: true),
              margin: EdgeInsets.only(
                bottom: 30,
              ),
            ),
            FormFieldContainer(
              SquareButton('Register', () {}),
            ),
            Divider(
              height: 1,
              color: Colors.black,
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRouter.LOGIN);
                },
                child: Text(
                  "Already have an account? Click Here!",
                  style: TextStyle(
                    //fontFamily: for another font,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
