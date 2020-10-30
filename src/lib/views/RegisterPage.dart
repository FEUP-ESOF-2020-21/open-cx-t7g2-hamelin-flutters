import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
              ),
              child: Text("Register",
                  textScaleFactor: 2.5,
                  style: GoogleFonts.lora(fontWeight: FontWeight.w600)),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              margin: EdgeInsets.only(
                top: 30.0,
              ),
              child: TextField(
                selectionWidthStyle: BoxWidthStyle.max,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                  ),
                  hintText: "Full Name",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: TextField(
                selectionWidthStyle: BoxWidthStyle.max,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                  ),
                  hintText: "Username",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: TextField(
                selectionWidthStyle: BoxWidthStyle.max,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                  ),
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 90,
              width: MediaQuery.of(context).size.width - 60,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: ElevatedButton(
                child: Text("Register"),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width - 60, 50),
                  ),
                ),
              ),
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
                  Navigator.popAndPushNamed(context, '/login');
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
