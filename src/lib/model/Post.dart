import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/User.dart';

class Post {
  final User _author;
  final String _title;
  final String _description;
  List<Comment> _comments;
  int _numberLikes = 0;
  int _numberDislikes = 0;

  Post(this._author, this._title, this._description, [this._comments]);

  User getAuthor() {
    return _author;
  }

  String getTitle() {
    return _title;
  }

  String getDescription() {
    return _description;
  }

  List<Comment> getComments() {
    return _comments;
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
