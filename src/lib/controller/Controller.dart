import 'package:flutter/material.dart';
import './database/Database.dart';

class Controller {
  Database _database;

  Controller(this._database);

  void startApp(StatelessWidget app) {
    runApp(app);
  }

  Database getDatabase() => _database;
}
