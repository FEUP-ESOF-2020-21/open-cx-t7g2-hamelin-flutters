import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetupButton extends StatefulWidget {
  final VoidCallback onButtonSelected;

  MeetupButton({this.onButtonSelected});
  @override
  _MeetupButtonState createState() => _MeetupButtonState();
}

class _MeetupButtonState extends State<MeetupButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        //side: BorderSide(color: Colors.red)
      ),
      color: Colors.green,
      textColor: Colors.white,
      splashColor: Colors.green[900],
      onPressed: () {
        widget.onButtonSelected();
      },
      child: Row(
        children: [
          Text(
            "Meetup",
            //style: meetupButtonTextStyle,
          ),
          //Icon(Icons.person),
        ],
      ),
    );
  }
}
