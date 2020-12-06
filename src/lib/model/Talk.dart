import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/User.dart';
import 'package:uuid/uuid.dart';

class Talk {
  int _id;
  String _title, _description, _imageURL;
  User _speaker;
  List<Tag> _tags = List<Tag>();
  String _code;

  Talk(this._id, this._title, this._description, this._speaker, this._imageURL,
      _tagsIn) {
    _tagsIn.forEach((t) => _tags.add(t));

    generateCode();
  }

  int getId() => _id;
  String getTitle() => _title;
  String getDescription() => _description;
  String getImageURL() => _imageURL;
  User getSpeaker() => _speaker;
  List<Tag> getTags() => _tags;
  String getCode() => _code;

  void setTitle(String title) => _title = title;
  void setDescription(String description) => _description = description;
  void setImageURL(String imageURL) => _imageURL = imageURL;
  void setSpeaker(User speaker) => _speaker = speaker;
  void setTags(List<Tag> tags) => _tags = tags;
  void setCode(String code) => _code = code;

  String generateCode() {
    var uuid = Uuid();
    String codeFull = uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
    _code = codeFull.substring(0, 8); // -> '110ec58a'
    return _code;
  }
}
