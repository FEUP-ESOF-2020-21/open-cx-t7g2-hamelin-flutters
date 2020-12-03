import 'package:confnect/model/User.dart';
import 'package:confnect/view/widgets/User/ProfileForumList.dart';
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
        /*ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),*/
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
                SizedBox(height: MediaQuery.of(context).size.height / 35.0),
                ProfileForumList(),
              ],
            ))
      ],
    );
  }
}

// ignore: camel_case_types
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
