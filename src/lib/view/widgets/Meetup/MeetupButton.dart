import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class MeetupButton extends StatefulWidget {
  double _height;

  MeetupButton(this._height);
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
      splashColor: Colors.greenAccent,
      onPressed: () {
        /*...*/
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
