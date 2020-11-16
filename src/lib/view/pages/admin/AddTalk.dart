import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:flutter/material.dart';

class AddTalk extends StatelessPage {
  AddTalk(Controller controller, {Key key}) : super(controller, key: key);

  final talkTitleController = TextEditingController();
  final talkDescriptionController = TextEditingController();
  final speakerUsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Talk",
          style: pageTitleTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            FormFieldContainer(
              FormTextField('Talk Title', talkTitleController),
              margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
            ),
            FormFieldContainer(
              FormTextField('Talk Description', talkDescriptionController),
            ),
            FormFieldContainer(
              FormTextField('Speaker Username', speakerUsernameController),
            ),
            FormFieldContainer(
              SquareButton(
                'Add talk',
                () {
                  String talkTitle = talkTitleController.text,
                      talkDescription = talkDescriptionController.text,
                      talkSpeakerUsername = speakerUsernameController.text;
                  print(talkTitle +
                      "\n" +
                      talkDescription +
                      "\n" +
                      talkSpeakerUsername);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
