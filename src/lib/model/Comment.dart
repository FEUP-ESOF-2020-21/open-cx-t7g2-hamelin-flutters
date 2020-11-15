import 'package:confnect/model/User.dart';

class Comment {
  final User _author;
  final String _description;
  final DateTime _date;
  int _numberLikes = 0;
  int _numberDislikes = 0;

  Comment(this._author, this._date, this._description);

  User getAuthor() {
    return _author;
  }

  DateTime getDate() {
    return _date;
  }

  String getDescription() {
    return _description;
  }

  int getNumberLikes() {
    return _numberLikes;
  }

  int getNumberDislikes() {
    return _numberDislikes;
  }

  incrementLike() {
    _numberLikes++;
  }

  decrementLike() {
    _numberLikes--;
  }

  incrementDislike() {
    _numberDislikes++;
  }

  decrementDislike() {
    _numberDislikes--;
  }
}
