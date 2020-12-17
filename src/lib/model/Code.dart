import 'package:confnect/model/Conference.dart';
import 'package:confnect/model/forums/Forum.dart';

class Code {
  final String _code;
  final List<Forum> _forums;
  final Conference _conference;
  final String _role;

  Code(this._code, this._forums, this._conference, this._role);

  String getCode() => _code;
  List<Forum> getForums() => _forums;
  Conference getConference() => _conference;
  String getRole() => _role;
}
