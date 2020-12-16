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
  int _numberLikes = 0, _numberDislikes = 0, _forumId;
  Meetup meetup;

  Post(this._forumId, this._author, this._title, this._description, this._date,
      {this.comments, this.meetup, this.pinnedComment});

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

  void removeComment(comment) {
    comments.remove(comment);
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

  void setMeetup(Meetup meetup) {
    this.meetup = meetup;
  }

  Meetup getMeetup() {
    return this.meetup;
  }
}
