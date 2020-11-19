import 'package:confnect/model/Tag.dart';
import 'package:confnect/model/User.dart';

class Talk {
  // ignore: unused_field
  final int _id;
  final String _title, _description, _imageURL;
  final User _speaker;
  final List<Tag> _tags;

  Talk(this._id, this._title, this._description, this._speaker, this._imageURL,
      this._tags);

  String getTitle() => _title;
  String getDescription() => _description;
  String getImageURL() => _imageURL;
  User getSpeaker() => _speaker;
  List<Tag> getTags() => _tags;
}
