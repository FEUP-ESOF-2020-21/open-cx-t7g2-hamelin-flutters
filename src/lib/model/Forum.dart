import 'package:confnect/model/User.dart';

class Forum {
  final User _author;
  final String _title;
  final String _description;
  Forum(this._author, this._title, this._description);

  User getAuthor() {
    return _author;
  }

  String getTitle() {
    return _title;
  }

  String getDescription() {
    return _description;
  }
}
