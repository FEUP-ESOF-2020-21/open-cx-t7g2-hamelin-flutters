import 'package:flutter/material.dart';
import './database/Database.dart';

class Controller {
  Database _database;
  String _loggedInUserName;
  Function _onSessionChange;
  bool _addingPost = false;

  Controller(this._database);

  void startApp(StatelessWidget app) {
    runApp(app);
  }

  void setLoggedInUserName(String username) {
    this._loggedInUserName = username;
    if (_onSessionChange != null) _onSessionChange();
  }

  void setAddingPost(bool _addingPost) => this._addingPost = _addingPost;

  bool isAddingPost() => this._addingPost;

  String getLoggedInUserName() => this._loggedInUserName;

  void setOnSessionChange(Function fn) => this._onSessionChange = fn;

  Database getDatabase() => _database;

  bool createPost(int forumId, String title, String text) {
    //TODO add notification messages
    if (title == "")
      return false;
    else if (text == "") return false;
    _database.addPost(forumId, _loggedInUserName, title, text);
    print("Post created");
    return true;
  }
}
