import 'package:confnect/view/widgets/forms/DateTimeForm.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetupDateTimeForm extends StatefulWidget {
  DateTime meetDate;
  TimeOfDay meetTime;
  final _timeKey = GlobalKey<FormState>();

  MeetupDateTimeForm(this.meetDate, this.meetTime);

  @override
  _MeetupDateTimeFormState createState() => _MeetupDateTimeFormState();
}

class _MeetupDateTimeFormState extends State<MeetupDateTimeForm> {
  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      DateTimeForm(
        key: widget._timeKey,
        labelText: "Start Time",
        selectedDate: new DateTime.now(),
        selectedTime: new TimeOfDay.now(),
        selectDate: (date) => {widget.meetDate = date},
        selectTime: (time) => {widget.meetTime = time},
        refresh: () {
          setState(() {});
        },
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
