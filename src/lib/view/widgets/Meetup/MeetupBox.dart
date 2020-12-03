import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/pages/MeetupPage.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetupBox extends StatefulWidget {
  Controller _controller;
  Meetup _meetup;
  MeetupBox(this._controller, this._meetup);
  @override
  _MeetupBoxState createState() => _MeetupBoxState();
}

class _MeetupBoxState extends State<MeetupBox> {
  onPressedIn() {
    setState(() {
      widget._meetup.addGoingUser(widget._controller.getLoggedInUser());
    });
  }

  onPressedOut() {
    setState(() {
      widget._meetup.removeGoingUser(widget._controller.getLoggedInUser());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: (Colors.green),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MeetupPage(widget._controller, widget._meetup)),
            ),
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Meetup",
                style: meetupButtonTitleStyle,
              ),
              Text(
                widget._meetup.getDescription() +
                    "\nClick here for more information.",
                style: meetupButtonTextStyle,
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: () => onPressedIn(),
                      color: widget._meetup.loggedUserIsGoing(
                              widget._controller.getLoggedInUser())
                          ? Colors.green[200]
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      child: Text("I'M IN!")),
                  SizedBox(
                    width: 5,
                  ),
                  FlatButton(
                      onPressed: () => onPressedOut(),
                      color: !widget._meetup.loggedUserIsGoing(
                              widget._controller.getLoggedInUser())
                          ? Colors.green[200]
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      child: Text("I'M OUT!")),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      widget._meetup.getNumberPeopleGoing().toString() +
                          " Going",
                      style: meetupButtonTextStyle,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
