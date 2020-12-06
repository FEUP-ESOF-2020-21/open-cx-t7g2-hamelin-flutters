import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/Meetup/meetupForms/locationForm.dart';
import 'package:confnect/view/widgets/forms/DateTimeForm.dart';
import 'package:flutter/material.dart';

import 'meetupForms/LocationFormSubmit.dart';
import 'meetupForms/MeetupDateTimeForum.dart';

// ignore: must_be_immutable
class MeetupInfo extends StatefulWidget {
  Meetup _meetup;
  bool _editingLocation = false;
  bool _editingDescription = false;
  bool _edtitingTime = false;

  MeetupInfo(this._meetup);
  @override
  _MeetupInfoState createState() => _MeetupInfoState();
}

class _MeetupInfoState extends State<MeetupInfo> {
  Widget showLocation() {
    return widget._editingLocation
        ? LocationFormSubmit(widget._meetup, finishEditingLocation)
        : Column(children: [
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
          ]);
  }

  Widget showTime() {
    TimeOfDay meetTime = new TimeOfDay.now();

    return widget._edtitingTime
        ? MeetupDateTimeForm(widget._meetup.getDate().getDateTime(), meetTime)
        : Row(
            children: [
              Icon(Icons.access_time),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(widget._meetup.getDate().getFormmatedDate()),
              ),
            ],
          );
  }

  finishEditingLocation() {
    setState(() {
      widget._editingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location",
                style: titleTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget._editingLocation = true;
                    });
                  },
                  child: Icon(Icons.edit),
                ),
              )
            ],
          ),
          showLocation(),
          SizedBox(
            height: 16,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Time - Date",
              style: titleTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget._edtitingTime = true;
                  });
                },
                child: Icon(Icons.edit),
              ),
            )
          ]),
          SizedBox(
            height: 8,
          ),
          showTime(),
          SizedBox(
            height: 16,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Description",
              style: titleTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: InkWell(
                child: Icon(Icons.edit),
              ),
            )
          ]),
          SizedBox(
            height: 8,
          ),
          Text(widget._meetup.getDescription()),
          SizedBox(
            height: 24,
          ),
          Text(
            "Already going (" +
                widget._meetup.getNumberPeopleGoing().toString() +
                ")",
            style: titleTextStyle,
            textScaleFactor: 0.8,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget._meetup.getPeopleGoing().join(", "),
            textScaleFactor: 0.9,
          ),
        ],
      ),
    );
  }
}
