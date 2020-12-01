import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Comment.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/User.dart';

class Meetup {
  Date _date;
  String _location;
  String _description;
  List<User> _peopleGoing = [];
  User _meetingCreator;
  List<Comment> _comments = [];

  Meetup(
    this._date,
    this._location,
    this._description,
    this._meetingCreator,
  ) {
    _peopleGoing.add(_meetingCreator);
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

  void setDate(Date newDate) {
    _date = newDate;
  }

  List<User> getPeopleGoing() {
    return _peopleGoing;
  }

  void addGoingUser(User user) {
    if (!_peopleGoing.contains(user)) _peopleGoing.add(user);
  }

  void removeGoingUser(User user) {
    if (_peopleGoing.contains(user)) _peopleGoing.remove(user);
  }

  bool loggedUserIsGoing(User user) {
    return _peopleGoing.contains(user);
  }

  int getNumberPeopleGoing() {
    return _peopleGoing.length;
  }

  String getLocation() {
    return _location;
  }

  void setPeopleGoing(List<User> newPeopleGoing) {
    _peopleGoing = newPeopleGoing;
  }

  void setLocation(String newLocation) {
    _location = newLocation;
  }
}
