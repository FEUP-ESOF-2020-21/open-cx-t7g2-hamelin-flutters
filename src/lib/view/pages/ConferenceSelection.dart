import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Conference.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import '../../view/widgets/conference/ConferenceTile.dart';

import 'package:flutter/material.dart';

class ConferenceSelection extends StatelessPage {
  ConferenceSelection(Controller controller, {Key key})
      : super(controller, key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  _viewConference(Conference c, BuildContext context) {
    super.getController().setConference(c);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> conferences = super
        .getController()
        .getDatabase()
        .getConferences(super.getController().getLoggedInUser())
        .map<Widget>((c) => ConferenceTile(
              c,
              (Conference c) {
                _viewConference(c, context);
              },
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Conferences", style: pageTitleTextStyle),
      ),
      body: ListView(
        children: conferences,
      ),
    );
  }
}
