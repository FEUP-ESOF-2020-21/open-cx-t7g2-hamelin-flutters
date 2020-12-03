import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/User.dart';

import 'Date.dart';

class Post {
  final User _author;
  final String _title, _description;
  final Date _date;
  List<Comment> _comments;
  Comment _pinnedComment;
  int _numberLikes = 0, _numberDislikes = 0, _forumId;

  Post(this._forumId, this._author, this._title, this._description, this._date,
      [this._comments, this._pinnedComment]);

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

  Date getDate() {
    return _date;
  }

  List<Comment> getComments() {
    return _comments;
  }

  Comment getPinnedComment() {
    return _pinnedComment;
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
