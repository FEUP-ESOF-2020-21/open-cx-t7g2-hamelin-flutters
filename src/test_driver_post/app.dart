import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/database/MockAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'main.dart';

void main() {
// This line enables the extension.
  enableFlutterDriverExtension();
  MockAdapter database = MockAdapter();
  Controller controller = Controller(database);
  controller.setLoggedInUserName("trump");
  runApp(ConfnectTest(controller));
}
