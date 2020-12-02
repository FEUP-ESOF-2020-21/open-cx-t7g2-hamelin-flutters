import 'package:confnect/model/Tag.dart';

import '../User.dart';

abstract class Forum {
  final int _id;
  Forum(this._id);

  int getId() => _id;

  String getTitle();

  String getImageURL();

  String getDescription();

  User getSpeaker() => null;

  List<Tag> getTags() => null;
}
