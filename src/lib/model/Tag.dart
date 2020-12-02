import 'package:flutter_tagging/flutter_tagging.dart';

class Tag extends Taggable {
  final String _name;
  String _description, _coverImageURL;
  final int _id;

  Tag(this._id, this._name, this._description, this._coverImageURL);

  String getName() => _name;
  int getId() => _id;
  String getDescription() => _description;
  String getCoverImageURL() => _coverImageURL;

  void setDescription(String description) {
    print("Tag " + _name + ", desc: " + description + "\n");
    this._description = description;
  }

  void setCoverImageURL(String coverImageURL) {
    print("Tag " + _name + ", cover: " + coverImageURL + "\n");
    this._coverImageURL = coverImageURL;
  }

  @override
  List<String> get props => [_name];
}
