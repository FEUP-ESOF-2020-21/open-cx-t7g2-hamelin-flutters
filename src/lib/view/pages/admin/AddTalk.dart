import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
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
  final talkImageURLController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Database db = super.getController().getDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Talk",
          style: pageTitleTextStyle,
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FormFieldContainer(
                FormTextField(
                  'Talk Title',
                  talkTitleController,
                  validator: ValidatorFactory.getValidator(
                    'Description',
                    fieldRequired: true,
                    lowerLimit: 10,
                    upperLimit: 50,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
              ),
              FormFieldContainer(
                FormTextField(
                  'Talk Description',
                  talkDescriptionController,
                  validator: ValidatorFactory.getValidator(
                    'Description',
                    fieldRequired: true,
                    lowerLimit: 20,
                    upperLimit: 75,
                  ),
                ),
              ),
              FormFieldContainer(
                FormTextField(
                  'Speaker Username',
                  speakerUsernameController,
                  validator: ValidatorFactory.getValidator(
                    'Speaker username',
                    fieldRequired: true,
                    extender: (value) {
                      if (!db.existsUser(value)) {
                        return "User with username " +
                            value.toString() +
                            " doesn't exist";
                      } else if (!db.hasRole(value, UserRole.HOST)) {
                        return "User with username " +
                            value.toString() +
                            " doesn't have HOST role";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              FormFieldContainer(
                FormTextField(
                  'Talk Image URL',
                  talkImageURLController,
                  validator: ValidatorFactory.getValidator('Talk image url',
                      fieldRequired: true),
                ),
              ),
              FormFieldContainer(
                SquareButton(
                  'Add talk',
                  () {
                    if (_formKey.currentState.validate()) {
                      String talkTitle = talkTitleController.text,
                          talkDescription = talkDescriptionController.text,
                          talkSpeakerUsername = speakerUsernameController.text,
                          talkImageURL = talkImageURLController.text;
                      db.addTalk(talkTitle, talkDescription,
                          talkSpeakerUsername, talkImageURL);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
