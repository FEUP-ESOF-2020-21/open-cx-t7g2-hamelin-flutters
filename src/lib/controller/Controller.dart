import 'package:flutter/material.dart';
import './database/Database.dart';

class Controller {
  Database _database;
  String _loggedInUserName;
  Function _onSessionChange;

  Controller(this._database);

  void startApp(StatelessWidget app) {
    runApp(app);
  }

  void setLoggedInUserName(String username) {
    this._loggedInUserName = username;
    if (_onSessionChange != null) _onSessionChange();
  }

  String getLoggedInUserName() => this._loggedInUserName;

  void setOnSessionChange(Function fn) => this._onSessionChange = fn;

  Database getDatabase() => _database;
}
