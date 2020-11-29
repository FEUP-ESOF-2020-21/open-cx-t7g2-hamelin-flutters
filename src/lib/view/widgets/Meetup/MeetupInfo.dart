import 'package:confnect/model/Meetup.dart';
import 'package:flutter/material.dart';

class MeetupInfo extends StatefulWidget {
  Meetup _meetup;

  MeetupInfo(this._meetup);
  @override
  _MeetupInfoState createState() => _MeetupInfoState();
}

class _MeetupInfoState extends State<MeetupInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.location_on),
              Text(widget._meetup.getLocation()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.access_time),
              Text(widget._meetup.getDate().getFormmatedDate()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget._meetup.getDescription()),
        ),
      ],
    );
  }
}
