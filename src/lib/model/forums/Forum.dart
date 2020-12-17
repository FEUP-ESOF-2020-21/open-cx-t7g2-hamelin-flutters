import 'package:confnect/model/Tag.dart';

import '../User.dart';

abstract class Forum {
  final int _id;
  List<Tag> _tags = new List();
  Forum(this._id);

  int getId() => _id;

  String getTitle();

  String getImageURL();

  String getDescription();

  User getSpeaker() => null;

  List<Tag> getTags() => _tags;

  List<String> getTagsNames() => null;

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Forum && other._id == _id;
  }

  @override
  String toString() {
    return "Forum " + _id.toString() + " : " + getTitle();
  }
}
