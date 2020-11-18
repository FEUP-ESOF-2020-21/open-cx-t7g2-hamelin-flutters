import 'package:flutter_tagging/flutter_tagging.dart';

class Tag extends Taggable {
  final String _name;
  final int _id;

  Tag(this._id, this._name);

  String getName() => _name;
  int getId() => _id;

  @override
  // TODO: implement props
  List<String> get props => [_name];
}
