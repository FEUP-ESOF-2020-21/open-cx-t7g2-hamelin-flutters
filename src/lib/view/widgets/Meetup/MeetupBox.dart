import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/pages/MeetupPage.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetupBox extends StatefulWidget {
  Controller _controller;
  Meetup _meetup;

  Function _eliminateMeetup;

  MeetupBox(this._controller, this._meetup, this._eliminateMeetup);
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

  cancelMeetup() {
    setState(() {
      widget._meetup = null;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attention!'),
          content: Text('Are you sure you want to delete the meeting?'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                cancelMeetup();
                widget._eliminateMeetup();
                Navigator.of(context).pop();
                deletedSuccess();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deletedSuccess() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notice!'),
          content: Text('The meeting has been canceled!'),
        );
      },
    );
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
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meetup",
                        style: meetupButtonTitleStyle,
                        textScaleFactor: 1.1,
                      ),
                      if (widget._meetup != null)
                        if (widget._controller.getLoggedInUser() ==
                            widget._meetup.getAuthor())
                          InkWell(
                            child: Icon(Icons.close),
                            onTap: () => {
                              _showMyDialog(),
                            },
                          ),
                    ]),
                margin: EdgeInsets.only(bottom: 5),
              ),
              Container(
                child: Text(
                  //widget._meetup.getDescription() +
                  "\nClick here for more information.",
                  style: meetupButtonTextStyle,
                ),
                margin: EdgeInsets.only(bottom: 20),
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
