import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class Date {
  final DateTime _dateTime;
  Date(this._dateTime);

  String getMinutesSinceComplete() {
    return timeago.format(this._dateTime);
  }

  String getMinutesSince() {
    return timeago.format(this._dateTime, locale: 'en_short');
  }

  DateTime getDateTime() {
    return this._dateTime;
  }

  String getFormmatedDate() {
    return DateFormat('kk:mm - dd/MM/yyyy').format(this._dateTime);
  }

  TimeOfDay getTime() {
    return new TimeOfDay(
        hour: this._dateTime.hour, minute: this._dateTime.minute);
  }
}
