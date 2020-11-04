import 'package:flutter/material.dart';
import '../controller/Controller.dart';

abstract class Page {
  getController();
}

abstract class StatelessPage extends StatelessWidget implements Page {
  final Controller _controller;
  StatelessPage(this._controller, {Key key}) : super(key: key);

  getController() => _controller;
}

abstract class StatefulPage extends StatefulWidget implements Page {
  final Controller _controller;
  StatefulPage(this._controller, {Key key}) : super(key: key);

  getController() => _controller;
}
