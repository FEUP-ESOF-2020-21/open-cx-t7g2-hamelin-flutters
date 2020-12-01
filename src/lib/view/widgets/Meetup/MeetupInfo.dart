import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetupInfo extends StatefulWidget {
  Meetup _meetup;

  MeetupInfo(this._meetup);
  @override
  _MeetupInfoState createState() => _MeetupInfoState();
}

class _MeetupInfoState extends State<MeetupInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: titleTextStyle,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(widget._meetup.getLocation()),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Time - Date",
            style: titleTextStyle,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(Icons.access_time),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(widget._meetup.getDate().getFormmatedDate()),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Description",
            style: titleTextStyle,
          ),
          SizedBox(
            height: 8,
          ),
          Text(widget._meetup.getDescription()),
        ],
      ),
    );
  }
}
