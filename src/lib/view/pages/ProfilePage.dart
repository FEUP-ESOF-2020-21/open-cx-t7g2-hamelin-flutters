import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/pages/EditProfilePage.dart';
import 'package:confnect/view/style/DescriptionTextWidget.dart';
import 'package:confnect/view/widgets/forum/HorizontalForumList.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulPage {
  final Function _refreshState;
  final User user;
  ProfilePage(Controller controller, this._refreshState, {this.user, Key key})
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
    User _viewingUser =
        widget.user == null ? _controller.getLoggedInUser() : widget.user;

    Function viewForumAction = (forumId) {
      if (widget.user != null) Navigator.pop(context);
      this._viewForum(forumId);
    };

    List<Forum> _userForums = _controller.getUserForums(_viewingUser);

    Widget profileForums =
        HorizontalForumList(_controller, viewForumAction, _userForums);

    return Scaffold(
        appBar: widget.user == null ? null : AppBar(),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Positioned(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _viewingUser.getBackgroundPicUrl()),
                                  fit: BoxFit.cover)),
                          child: Column(children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 17.5),
                            Container(
                                width: MediaQuery.of(context).size.width / 3.0,
                                height:
                                    MediaQuery.of(context).size.height / 6.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            _viewingUser.getAvatarUrl()),
                                        fit: BoxFit.cover),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(75.0)),
                                    border: Border.all(
                                        color: Colors.white, width: 5))),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 200.0),
                            Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  _viewingUser.getFullName(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = Colors.black,
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  _viewingUser.getFullName(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 400.0),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Center(
                                    child: Stack(children: <Widget>[
                                  // Stroked text as border.
                                  Text(
                                    "@" + _viewingUser.getUsername(),
                                    style: TextStyle(
                                      fontSize: 17,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 2
                                        ..color = Colors.black,
                                    ),
                                  ),
                                  // Solid text as fill.
                                  Text(
                                    "@" + _viewingUser.getUsername(),
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ])))
                          ])),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 50.0),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Center(
                              child: DescriptionTextWidget(
                            text: _viewingUser.getBio(),
                            fontSize: 15.0,
                          ))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 35.0),
                      _viewingUser == _controller.getLoggedInUser()
                          ? Container(
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
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                30.0,
                                        color: Colors.white),
                                  ),
                                  highlightedBorderColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfilePage(
                                              _controller,
                                              _refreshProfileState)),
                                    );
                                  },
                                ),
                              ))
                          : Divider(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 25.0),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Forums',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 100.0),
                      if (_userForums.length != 0)
                        Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [profileForums]))
                      else
                        Column(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 50.0,
                            ),
                            Text(
                              "No forums found...",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            )
                          ],
                        )
                    ],
                  )),
            )
          ],
        ));
  }
}
