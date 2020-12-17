import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/pages/AddAccessCode.dart';
import 'package:confnect/view/pages/CreateConference.dart';
import 'package:confnect/view/widgets/LogoutButton.dart';
import 'package:confnect/view/widgets/TextOnlyButton.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:confnect/view/widgets/PageTitle.dart';

import 'package:flutter/material.dart';

import 'ConferenceSelection.dart';

class ConferenceScreen extends StatelessPage {
  ConferenceScreen(Controller controller, {Key key})
      : super(controller, key: Key("ConferenceScreen"));

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          image: NetworkImage(
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftech.eu%2Fwp-content%2Fuploads%2F2018%2F04%2Finfoshare-pic.jpg&f=1&nofb=1"),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Color.fromARGB(130, 0, 0, 0),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[
                Spacer(
                  flex: 3,
                ),
                LogoutButton(super.getController(), Colors.white),
                Spacer(
                  flex: 3,
                ),
                PageTitle(
                  "Hi, " +
                      super.getController().getLoggedInUser().getFullName(),
                  white: true,
                  scaleFactor: 1.7,
                  margin: EdgeInsets.only(bottom: 30, left: 30),
                ),
                FormFieldContainer(
                  SquareButton('SELECT CONFERENCE', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConferenceSelection(
                                super.getController(),
                              )),
                    );
                  }, white: true),
                ),
                Spacer(
                  flex: 5,
                ),
                TextOnlyButton(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddAccessCode(
                                super.getController(),
                              )),
                    );
                  },
                  text: 'ADD CONFERENCE',
                  white: true,
                ),
                TextOnlyButton(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateConference(
                                super.getController(),
                              )),
                    );
                  },
                  text: 'CREATE CONFERENCE',
                  white: true,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
