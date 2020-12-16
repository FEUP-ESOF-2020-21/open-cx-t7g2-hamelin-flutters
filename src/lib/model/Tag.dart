import 'package:flutter_tagging/flutter_tagging.dart';

// ignore: must_be_immutable
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
    this._description = description;
  }

  void setCoverImageURL(String coverImageURL) {
    this._coverImageURL = coverImageURL;
  }

  @override
  List<String> get props => [_name];
}
