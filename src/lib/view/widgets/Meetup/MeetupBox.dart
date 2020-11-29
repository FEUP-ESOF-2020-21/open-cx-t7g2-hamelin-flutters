import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class MeetupBox extends StatefulWidget {
  @override
  _MeetupBoxState createState() => _MeetupBoxState();
}

class _MeetupBoxState extends State<MeetupBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(10),
      height: 200,
      color: (Colors.green),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Meetup",
              style: meetupButtonTitleStyle,
            ),
            Text(
              "I'm enjoying the conversation, Let's Meetup!",
              style: meetupButtonTextStyle,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: FlatButton(
                      onPressed: () => {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      child: Text("I'M IN!")),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: FlatButton(
                      onPressed: () => {},
                      color: Colors.white,
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
    );
  }
}
