import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/User.dart';

class Talk {
  // ignore: unused_field
  int _id;
  String _title, _description, _imageURL;
  User _speaker;
  List<Tag> _tags;

  Talk(this._id, this._title, this._description, this._speaker, this._imageURL,
      this._tags);

  int getId() => _id;
  String getTitle() => _title;
  String getDescription() => _description;
  String getImageURL() => _imageURL;
  User getSpeaker() => _speaker;
  List<Tag> getTags() => _tags;

  void setTitle(String title) => _title = title;
  void setDescription(String description) => _description = description;
  void setImageURL(String imageURL) => _imageURL = imageURL;
  void setSpeaker(User speaker) => _speaker = speaker;
  void setTags(List<Tag> tags) => _tags = tags;
}
