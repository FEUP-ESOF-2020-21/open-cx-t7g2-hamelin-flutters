import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/pages/admin/TagManager.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:flutter/material.dart';

class CreateConference extends StatelessPage {
  CreateConference(Controller controller, {Key key})
      : super(controller, key: key);

  final conferenceNameController = TextEditingController();
  final conferenceDescriptionController = TextEditingController();
  final conferenceLocationController = TextEditingController();
  final conferenceImageURLController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Controller controller = super.getController();
    Database db = controller.getDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Conference",
          style: pageTitleTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormFieldContainer(
                  FormTextField(
                    'Conference Name',
                    conferenceNameController,
                    validator: ValidatorFactory.getValidator(
                      'Name',
                      fieldRequired: true,
                      lowerLimit: 5,
                      upperLimit: 50,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                ),
                FormFieldContainer(
                  FormTextField(
                    'Conference Location',
                    conferenceLocationController,
                    validator: ValidatorFactory.getValidator(
                      'Location',
                      fieldRequired: true,
                      lowerLimit: 5,
                      upperLimit: 50,
                    ),
                  ),
                ),
                FormFieldContainer(
                  FormTextField(
                    'Conference Image URL',
                    conferenceImageURLController,
                    validator: ValidatorFactory.getValidator(
                        'Conference image url',
                        fieldRequired: true),
                  ),
                ),
                FormFieldContainer(
                  FormTextField(
                    'Conference Description',
                    conferenceDescriptionController,
                    maxLines: 5,
                    validator: ValidatorFactory.getValidator(
                      'Description',
                      fieldRequired: true,
                      lowerLimit: 20,
                      upperLimit: 150,
                    ),
                  ),
                ),
                FormFieldContainer(
                  SquareButton(
                    'Create conference',
                    () {
                      if (_formKey.currentState.validate()) {
                        String conferenceName = conferenceNameController.text,
                            conferenceDescription =
                                conferenceDescriptionController.text,
                            conferenceLocation =
                                conferenceLocationController.text,
                            conferenceImageURL =
                                conferenceImageURLController.text;

                        print("Created conference");
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
