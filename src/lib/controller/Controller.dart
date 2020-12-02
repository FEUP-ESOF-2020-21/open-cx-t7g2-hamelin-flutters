import 'package:confnect/model/Date.dart';
import 'package:confnect/model/SearchResult.dart';
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

  void changeAddingPost() => this._addingPost = !this._addingPost;

  bool isAddingPost() => this._addingPost;

  String getLoggedInUserName() => this._loggedInUserName;

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
}
