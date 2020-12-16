import 'package:confnect/model/Conference.dart';
import 'package:confnect/model/forums/Forum.dart';

class Code {
  final String _code;
  final List<Forum> _forums;
  final Conference _conference;

  Code(this._code, this._forums, this._conference);

  String getCode() => _code;
  List<Forum> getForums() => _forums;
  Conference getConference() => _conference;
}
