import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/Meetup/meetupForms/DescriptionForm.dart';
import 'package:flutter/material.dart';

import 'meetupForms/LocationFormSubmit.dart';
import 'meetupForms/MeetupDateTimeForum.dart';

// ignore: must_be_immutable
class MeetupInfo extends StatefulWidget {
  Meetup _meetup;
  bool _editingLocation = false;
  bool _editingDescription = false;
  bool _edtitingTime = false;
  TextEditingController _locationController = new TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

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
                  child: Text(widget._meetup.getLocation()),
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
        : Text(widget._meetup.getDescription());
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
    TimeOfDay meetTime = new TimeOfDay.now();

    return widget._edtitingTime
        ? MeetupDateTimeForm(
            widget._meetup.getDate().getDateTime(),
            meetTime,
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
              widget._edtitingTime = true;
            });
          },
          child: widget._edtitingTime
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget._edtitingTime = false;
                    });
                  },
                  child: Icon(Icons.done))
              : Icon(Icons.edit),
        ),
      )
    ]);
  }
}
