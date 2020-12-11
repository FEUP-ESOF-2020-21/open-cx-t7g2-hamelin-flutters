import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/model/User.dart';

import 'Date.dart';

class Post {
  final User _author;
  final String _title, _description;
  final Date _date;
  List<Comment> comments;
  Comment pinnedComment;
  List<User> _likes;
  List<User> _dislikes;
  int _forumId;
  Meetup meetup;

  Post(this._forumId, this._author, this._title, this._description, this._date,
      {this.comments, this.meetup, this.pinnedComment}) {
    this._likes = new List<User>();
    this._dislikes = new List<User>();
  }

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
    return comments;
  }

  Comment getPinnedComment() {
    return pinnedComment;
  }

  void pinComment(Comment comment) {
    pinnedComment = comment;
  }

  addComment(author, date, description) {
    Comment c = new Comment(author, date, description);
    comments.add(c);
  }

  List<User> getUserLikes() {
    return _likes;
  }

  List<User> getUserDislikes() {
    return _dislikes;
  }

  incrementLike(User user) {
    if (!_likes.contains(user)) {
      _likes.add(user);
      if (_dislikes.contains(user)) {
        _dislikes.remove(user);
      }
    }
  }

  decrementLike(User user) {
    if (_likes.contains(user)) _likes.remove(user);
  }

  incrementDislike(User user) {
    if (!_dislikes.contains(user)) {
      _dislikes.add(user);
      if (_likes.contains(user)) {
        _likes.remove(user);
      }
    }
  }

  decrementDislike(User user) {
    if (_dislikes.contains(user)) _dislikes.remove(user);
  }

  void setMeetup(Meetup meetup) {
    this.meetup = meetup;
  }

  Meetup getMeetup() {
    return this.meetup;
  }

  bool userLiked(User user) {
    return _likes.contains(user);
  }

  bool userDisLiked(User user) {
    return _dislikes.contains(user);
  }
}
