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
    return Container(
      //margin: EdgeInsets.all(10),
      height: 150,
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
                "I'm enjoying the conversation, Let's Meetup!\nClick in this Box for more information.",
                style: meetupButtonTextStyle,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: FlatButton(
                        onPressed: () => onPressedIn(),
                        color: widget._meetup.loggedUserIsGoing(
                                widget._controller.getLoggedInUser())
                            ? Colors.greenAccent
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        child: Text("I'M IN!")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: FlatButton(
                        onPressed: () => onPressedOut(),
                        color: !widget._meetup.loggedUserIsGoing(
                                widget._controller.getLoggedInUser())
                            ? Colors.greenAccent
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        child: Text("I'M OUT!")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
