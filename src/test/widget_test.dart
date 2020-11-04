// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/AppModel.dart';
import 'package:confnect/view/PageFactory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:confnect/main.dart';

void main() {
  testWidgets('Title is being displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    PageFactory pageFactory = PageFactory(Controller(AppModel('Test')));
    await tester.pumpWidget(Confnect(pageFactory));

    // Verify that our counter starts at 0.
    expect(find.text('Test'), findsOneWidget);
    //expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    /*await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);*/
  });
}
