import 'package:confnect/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
                height: 540,
                margin: EdgeInsets.only(
                  top: 60,
                  left: 30.0,
                ),
                child: Text("Confnect",
                    textScaleFactor: 2.5,
                    style: GoogleFonts.lora(fontWeight: FontWeight.w600))),
            Container(
              alignment: Alignment.topLeft,
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.LOGIN_PAGE);
                },
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
            Container(
              alignment: Alignment.topLeft,
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: ElevatedButton(
                child: Text("Register"),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.REGISTER_PAGE);
                },
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
          ],
        ),
      ),
    );
  }
}
