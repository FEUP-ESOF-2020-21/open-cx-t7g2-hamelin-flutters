import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/User.dart';

class Post {
  final User _author;
  final String _title, _description;
  List<Comment> _comments;
  int _numberLikes = 0, _numberDislikes = 0, _forumId;

  Post(this._forumId, this._author, this._title, this._description,
      [this._comments]);

  int getForumId() => _forumId;

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

  addComment(author, date, description) {
    Comment c = new Comment(author, date, description);
    _comments.add(c);
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
