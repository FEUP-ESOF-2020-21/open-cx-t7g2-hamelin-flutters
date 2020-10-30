import 'package:flutter/material.dart';
import '../model/AppModel.dart';

class Controller {
  AppModel _appModel;
  Controller(this._appModel);

  void startApp(StatelessWidget app) {
    runApp(app);
  }

  AppModel getModel() => _appModel;
}
