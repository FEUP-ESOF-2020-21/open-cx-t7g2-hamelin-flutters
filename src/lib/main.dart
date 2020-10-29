//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Confnect',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.white,
          primarySwatch: Colors.grey,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Confnect'),
        routes: <String, WidgetBuilder>{
          '/login': (context) => Login(),
          '/register': (context) => Register()
        });
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
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
                child: Text(this.title,
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
                  Navigator.pushNamed(context, '/login');
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
                  Navigator.pushNamed(context, '/register');
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

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              child: Text("Login",
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
                child: Text("Login"),
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
                  Navigator.popAndPushNamed(context, '/register');
                },
                child: Text(
                  "Don't have an account? Click Here!",
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
