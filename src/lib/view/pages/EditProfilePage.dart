import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
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
  final Function _refreshProfileState;
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final profilePicURL = TextEditingController();

  _EditProfilePageState(this._controller, this._refreshProfileState);

  @override
  Widget build(BuildContext context) {
    User _loggedInUser = _controller.getLoggedInUser();
    Database db = _controller.getDatabase();

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
                    'Current fullname: ' + _loggedInUser.getFullName(),
                    fullNameController,
                    validator: ValidatorFactory.getValidator(
                      'fullname',
                      fieldRequired: false,
                      lowerLimit: 5,
                      upperLimit: 50,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                ),
                FormFieldContainer(
                  FormTextField(
                    'Current username: ' + _loggedInUser.getUsername(),
                    usernameController,
                    validator: ValidatorFactory.getValidator('username',
                        fieldRequired: false,
                        lowerLimit: 5,
                        upperLimit: 20, extender: (value) {
                      if (db.existsUser(value) &&
                          value != _loggedInUser.getUsername()) {
                        return "User with username " +
                            value.toString() +
                            " already exists!";
                      }
                    }),
                  ),
                ),
                FormFieldContainer(
                  FormTextField(
                    'New profile image URL',
                    profilePicURL,
                    validator: ValidatorFactory.getValidator('image url',
                        fieldRequired: false, upperLimit: 300),
                  ),
                ),
                FormFieldContainer(
                  SquareButton('Confirm changes', () {
                    _controller.updateUser(
                        _loggedInUser,
                        fullNameController.text,
                        usernameController.text,
                        profilePicURL.text);
                    _refreshProfileState();
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
