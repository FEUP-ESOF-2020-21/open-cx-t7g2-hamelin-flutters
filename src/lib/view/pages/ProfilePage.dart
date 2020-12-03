import 'package:confnect/model/User.dart';
import 'package:confnect/view/pages/EditProfilePage.dart';
import 'package:flutter/material.dart';

import '../Page.dart';
import '../../controller/Controller.dart';
//https://github.com/rajayogan/flutter-profilescreen/blob/master/lib/main.dart

class ProfilePage extends StatefulPage {
  final Function _refreshState;
  ProfilePage(Controller controller, this._refreshState, {Key key})
      : super(controller, key: key);

  @override
  _ProfilePageState createState() =>
      _ProfilePageState(getController(), this._refreshState);
}

class _ProfilePageState extends State<ProfilePage> {
  final Controller _controller;
  final Function _viewForum;

  _ProfilePageState(this._controller, this._viewForum);

  void _refreshProfileState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    User _loggedInUser = _controller.getLoggedInUser();
    List<Widget> profileForumList =
        _controller.buildProfileForumList(_loggedInUser, this._viewForum);

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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                    _controller, _refreshProfileState)),
                          );
                        },
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height / 25.0),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Forums',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
                SizedBox(height: MediaQuery.of(context).size.height / 30.0),
                if (profileForumList.length != 0)
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: profileForumList)
                else
                  Column(
                    children: [
                      Icon(
                        IconData(59828, fontFamily: 'MaterialIcons'),
                        color: Colors.black,
                        size: 50.0,
                      ),
                      Text(
                        "No foruns found...",
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      )
                    ],
                  )
              ],
            ))
      ],
    );
  }
}
