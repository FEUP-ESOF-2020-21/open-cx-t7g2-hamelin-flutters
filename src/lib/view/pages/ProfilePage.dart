import 'package:confnect/model/User.dart';
import 'package:flutter/material.dart';

import '../Page.dart';
import '../../controller/Controller.dart';
//https://github.com/rajayogan/flutter-profilescreen/blob/master/lib/main.dart

class ProfilePage extends StatefulPage {
  ProfilePage(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(getController());
}

class _ProfilePageState extends State<ProfilePage> {
  final Controller _controller;

  _ProfilePageState(this._controller);

  @override
  Widget build(BuildContext context) {
    User _loggedInUser = _controller.getLoggedInUser();

    return Stack(
      children: <Widget>[
        Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 25,
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width / 3.0,
                    height: MediaQuery.of(context).size.height / 6.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(_loggedInUser.getAvatarUrl()),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: MediaQuery.of(context).size.height / 35.0),
                Text(_loggedInUser.getFullName(),
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                SizedBox(height: MediaQuery.of(context).size.height / 40.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Center(
                        child: Text(_loggedInUser.getBio(),
                            style: TextStyle(fontSize: 17.0)))),
                SizedBox(height: MediaQuery.of(context).size.height / 35.0),
                Container(
                    height: MediaQuery.of(context).size.height / 31.0,
                    width: MediaQuery.of(context).size.width / 4.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: OutlineButton(
                        child: Text(
                          "Edit profile",
                          style: TextStyle(fontSize: 12.5, color: Colors.white),
                        ),
                        highlightedBorderColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {},
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height / 25.0),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Forums',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _controller.buildProfileForumList(_loggedInUser))
              ],
            ))
      ],
    );
  }
}
