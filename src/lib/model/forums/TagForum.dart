import 'package:confnect/model/Tag.dart';

import 'Forum.dart';

class TagForum extends Forum {
  Tag _tag;
  TagForum(_id, this._tag) : super(_id);

  String getTitle() {
    return this._tag.getName();
  }

  String getImageURL() {
    return this._tag.getCoverImageURL();
  }

  String getDescription() {
    return this._tag.getDescription();
  }
}
