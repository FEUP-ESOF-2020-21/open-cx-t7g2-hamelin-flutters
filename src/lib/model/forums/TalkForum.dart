import 'package:confnect/model/Talk.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/model/forums/Forum.dart';

import '../Tag.dart';

class TalkForum extends Forum {
  Talk _talk;
  TalkForum(_id, this._talk) : super(_id);

  String getTitle() {
    return this._talk.getTitle();
  }

  String getImageURL() {
    return this._talk.getImageURL();
  }

  String getDescription() {
    return this._talk.getDescription();
  }

  @override
  User getSpeaker() {
    return this._talk.getSpeaker();
  }

  @override
  List<Tag> getTags() {
    return this._talk.getTags();
  }

  @override
  List<String> getTagsNames() {
    print(
        "Hello, " + this._talk.getTitle() + _talk.getTags().length.toString());
    final names = List<String>();
    this._talk.getTags().forEach((tag) {
      names.add(tag.getName());
      print(tag.getName());
    });
    return names;
  }
}
