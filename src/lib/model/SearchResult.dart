import 'Post.dart';
import 'User.dart';
import 'forums/Forum.dart';

class SearchResult {
  final List<Forum> _forums;
  final List<User> _users;
  final List<Post> _posts;

  SearchResult(this._forums, this._users, this._posts);

  List<Forum> getForums() => _forums;
  List<User> getUsers() => _users;
  List<Post> getPosts() => _posts;
}
