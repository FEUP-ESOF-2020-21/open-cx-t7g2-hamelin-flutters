import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/MockAdapter.dart';
import 'package:confnect/main.dart';
import 'package:confnect/view/PageFactory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
// This line enables the extension.
  enableFlutterDriverExtension();
  Controller controller = Controller(MockAdapter());
  runApp(Confnect(PageFactory(controller)));
}
