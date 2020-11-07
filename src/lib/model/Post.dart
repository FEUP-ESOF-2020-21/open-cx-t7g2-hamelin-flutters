import 'package:confnect/model/User.dart';

class Post {
  final User _author;
  final String _title;
  final String _description;
  int _numberLikes = 0;
  int _numberDislikes = 0;

  Post(this._author, this._title, this._description);

  User getAuthor() {
    return _author;
  }

  String getTitle() {
    return _title;
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
}
