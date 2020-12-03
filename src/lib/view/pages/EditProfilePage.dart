import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:flutter/material.dart';

import '../Page.dart';
import '../../controller/Controller.dart';

class EditProfilePage extends StatefulPage {
  final Function _refreshState;
  EditProfilePage(Controller controller, this._refreshState, {Key key})
      : super(controller, key: key);

  @override
  _EditProfilePageState createState() =>
      _EditProfilePageState(getController(), this._refreshState);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final Controller _controller;
  final Function _refreshState;
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final profilePicURL = TextEditingController();

  _EditProfilePageState(this._controller, this._refreshState);

  @override
  Widget build(BuildContext context) {
    User _loggedInUser = _controller.getLoggedInUser();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
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
                    'New fullname',
                    fullNameController,
                    validator: ValidatorFactory.getValidator(
                      'fullname',
                      fieldRequired: false,
                      lowerLimit: 10,
                      upperLimit: 50,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                ),
                FormFieldContainer(
                  FormTextField(
                    'New username',
                    usernameController,
                    validator: ValidatorFactory.getValidator(
                      'username',
                      fieldRequired: false,
                      lowerLimit: 20,
                      upperLimit: 75,
                    ),
                  ),
                ),
                FormFieldContainer(
                  FormTextField(
                    'New profile image URL',
                    profilePicURL,
                    validator: ValidatorFactory.getValidator('image url',
                        fieldRequired: false),
                  ),
                ),
                FormFieldContainer(
                  SquareButton('Confirm changes', () {
                    Navigator.pop(context);
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
