import 'package:confnect/view/widgets/forms/DateTimeForm.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetupDateTimeForm extends StatefulWidget {
  final _timeKey = GlobalKey<FormState>();
  final Function _selectMeetDate, _selectMeetTime;
  final DateTime _meetDate;
  final TimeOfDay _meetTime;

  MeetupDateTimeForm(this._meetDate, this._meetTime, this._selectMeetDate,
      this._selectMeetTime);

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
        selectedDate: widget._meetDate,
        selectedTime: widget._meetTime,
        selectDate: widget._selectMeetDate,
        selectTime: widget._selectMeetTime,
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
