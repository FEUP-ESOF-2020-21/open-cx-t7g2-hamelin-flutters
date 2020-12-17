import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final button = find.byValueKey(input1);
    //DESCOMENTAR
    await FlutterDriverUtils.isPresent(world.driver, button);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string}");
}

class ClickLoginButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String loginbtn) async {
    final loginfinder = find.byValueKey(loginbtn);
    await FlutterDriverUtils.tap(world.driver, loginfinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckIfHomePageIsPresent extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final homefinder = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, homefinder);
    // await FlutterDriverUtils.waitForFlutter(world.driver);
  }

  @override
  RegExp get pattern => RegExp(r"I should have {string} on screen");
}
