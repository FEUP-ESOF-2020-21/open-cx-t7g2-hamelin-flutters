import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/meetup/meetupforms/DescriptionForm.dart';
import 'package:flutter/material.dart';

import 'meetupforms/LocationFormSubmit.dart';
import 'meetupforms/MeetupDateTimeForum.dart';

// ignore: must_be_immutable
class MeetupInfo extends StatefulWidget {
  Meetup _meetup;
  DateTime _meetDate;
  TimeOfDay _meetTime;
  bool _editingLocation = false;
  bool _editingDescription = false;
  bool _editingTime = false;
  TextEditingController _locationController = new TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  MeetupInfo(this._meetup) {
    _meetDate = _meetup.getDate().getDateTime();
    _meetTime = _meetup.getDate().getTime();
  }
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
          showLocationHeader(),
          showLocation(),
          SizedBox(
            height: 16,
          ),
          showTimeHeader(),
          SizedBox(
            height: 8,
          ),
          showTime(),
          SizedBox(
            height: 16,
          ),
          showDescriptionHeader(),
          SizedBox(
            height: 8,
          ),
          showDescription(),
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

  Widget showLocation() {
    return widget._editingLocation
        ? LocationFormSubmit(widget._locationController)
        : Column(children: [
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    widget._meetup.getLocation(),
                    key: Key('MeetupLocation'),
                  ),
                ),
              ],
            ),
          ]);
  }

  Widget showLocationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Location",
          style: titleTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: widget._editingLocation
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget._editingLocation = false;
                      widget._meetup
                          .setLocation(widget._locationController.text);
                    });
                  },
                  child: Icon(Icons.done))
              : InkWell(
                  onTap: () {
                    setState(() {
                      widget._editingLocation = true;
                    });
                  },
                  child: Icon(Icons.edit)),
        )
      ],
    );
  }

  Widget showDescription() {
    return widget._editingDescription
        ? DescriptionForum(widget._descriptionController)
        : Text(
            widget._meetup.getDescription(),
            key: Key('MeetupDescription'),
          );
  }

  Widget showDescriptionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Description",
          style: titleTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: widget._editingDescription
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget._editingDescription = false;
                      widget._meetup
                          .setDescription(widget._descriptionController.text);
                    });
                  },
                  child: Icon(Icons.done))
              : InkWell(
                  onTap: () {
                    setState(() {
                      widget._editingDescription = true;
                    });
                  },
                  child: Icon(Icons.edit)),
        )
      ],
    );
  }

  Widget showTime() {
    return widget._editingTime
        ? MeetupDateTimeForm(
            widget._meetDate,
            widget._meetTime,
            (date) {
              setState(() {
                widget._meetDate = date;
              });
            },
            (time) {
              setState(() {
                widget._meetTime = time;
              });
            },
          )
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

  Widget showTimeHeader() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "Time - Date",
        style: titleTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: InkWell(
          onTap: () {
            setState(() {
              widget._editingTime = true;
            });
          },
          child: widget._editingTime
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget._editingTime = false;
                      DateTime newDate = new DateTime(
                          widget._meetDate.year,
                          widget._meetDate.month,
                          widget._meetDate.day,
                          widget._meetTime.hour,
                          widget._meetTime.minute);
                      widget._meetup.setDate(Date(newDate));
                    });
                  },
                  child: Icon(Icons.done))
              : Icon(Icons.edit),
        ),
      )
    ]);
  }
}
