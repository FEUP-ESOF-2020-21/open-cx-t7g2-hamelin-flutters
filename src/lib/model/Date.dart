import 'package:timeago/timeago.dart' as timeago;

class Date {
  final DateTime _dateTime;
  Date(this._dateTime);

  String getMinutesSinceComplete() {
    return timeago.format(this._dateTime);
  }

  String getMinutesSince() {
    return timeago.format(this._dateTime, locale: 'en_short');
  }
}
