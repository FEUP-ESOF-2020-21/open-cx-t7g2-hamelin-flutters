import 'package:confnect/model/Date.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/model/SearchResult.dart';
import 'package:confnect/model/forums/Forum.dart';
import 'package:confnect/view/widgets/User/ProfileForumListTile.dart';
import 'package:flutter/material.dart';
import './database/Database.dart';
import 'SearchController.dart';

class Controller {
  final Database _database;
  final SearchController _searchController;
  String _loggedInUserName;
  Function _onSessionChange;
  bool _addingPost = false;
  int currentForumId = -1;

  Controller(this._database) : _searchController = SearchController(_database);

  void startApp(StatelessWidget app) {
    runApp(app);
  }

  int getCurrentForumId() => this.currentForumId;
  void setCurrentForumId(forumId) {
    this.currentForumId = forumId;
  }

  void setLoggedInUserName(String username) {
    this._loggedInUserName = username;
    if (_onSessionChange != null) _onSessionChange();
  }

  SearchResult search(String key) {
    return _searchController.search(key);
  }

  User getLoggedInUser() {
    return this._database.getUser(this._loggedInUserName);
  }

  void changeAddingPost() => this._addingPost = !this._addingPost;

  bool isAddingPost() => this._addingPost;

  String getLoggedInUserName() => this._loggedInUserName;

  String getLoggedInFullName() =>
      this.getDatabase().getUser(this._loggedInUserName).getFullName();

  void setOnSessionChange(Function fn) => this._onSessionChange = fn;

  Database getDatabase() => _database;

  bool createPost(int forumId, String title, String text, Date date) {
    //TODO add notification messages
    if (title == "")
      return false;
    else if (text == "") return false;
    _database.addPost(forumId, _loggedInUserName, title, text, date);
    print("Post created");
    return true;
  }

  List<Widget> buildProfileForumList(User user, Function refreshState) {
    return user
        .getUserForunsIds()
        .map((e) =>
            ProfileForumListTile(_database.getForum(e), this, refreshState, 10))
        .toList();
  }

  List<Forum> getUserForums(User user) {
    return user.getUserForunsIds().map((e) => _database.getForum(e)).toList();
  }

  void updateUser(
      User user, String fullname, String description, String profilePicURL) {
    if (fullname.length != 0) user.setFullName(fullname);
    if (description.length != 0) user.setBio(description);
    if (profilePicURL.length != 0) user.setAvatarUrl(profilePicURL);
    //setLoggedInUserName(user.getUsername());
  }
}
