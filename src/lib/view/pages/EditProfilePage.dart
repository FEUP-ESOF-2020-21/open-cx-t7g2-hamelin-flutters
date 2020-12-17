import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/model/User.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
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

  _EditProfilePageState(this._controller, this._refreshProfileState);

  @override
  Widget build(BuildContext context) {
    User _loggedInUser = _controller.getLoggedInUser();

    final fullNameController =
        TextEditingController(text: _loggedInUser.getFullName());
    final profilePicUrl = TextEditingController();
    final backgroundPicUrl = TextEditingController();
    final descriptionController =
        TextEditingController(text: _loggedInUser.getBio());

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
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        left: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.height / 10 - 30,
                        child: Text(
                          'Fullname',
                          textAlign: TextAlign.left,
                          style: pageTitleTextStyle,
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 10,
                        child: FormFieldContainer(
                          FormTextField('Fullname', fullNameController,
                              validator: ValidatorFactory.getValidator(
                                  'fullname',
                                  fieldRequired: false,
                                  lowerLimit: 5,
                                  upperLimit: 50)),
                        )),
                    Positioned(
                        left: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.height * 2.4 / 10 - 30,
                        child: Text(
                          'Profile bio',
                          textAlign: TextAlign.left,
                          style: pageTitleTextStyle,
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 2.4 / 10,
                        child: FormFieldContainer(
                          FormTextField(
                            'New profile description',
                            descriptionController,
                            maxLines: 5,
                            validator: ValidatorFactory.getValidator(
                                'profile description',
                                fieldRequired: false,
                                upperLimit: 50),
                          ),
                          height: MediaQuery.of(context).size.height / 5,
                        )),
                    Positioned(
                        left: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.height * 4.7 / 10 - 30,
                        child: Text(
                          'Avatar URL',
                          textAlign: TextAlign.left,
                          style: pageTitleTextStyle,
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 4.7 / 10,
                        child: FormFieldContainer(
                          FormTextField(
                            'Avatar URL',
                            profilePicUrl,
                            validator: ValidatorFactory.getValidator(
                                'image url',
                                fieldRequired: false,
                                upperLimit: 300),
                          ),
                        )),
                    Positioned(
                        left: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.height * 6.2 / 10 - 30,
                        child: Text(
                          'Background URL',
                          textAlign: TextAlign.left,
                          style: pageTitleTextStyle,
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 6.2 / 10,
                        child: FormFieldContainer(
                          FormTextField(
                            'Background URL',
                            backgroundPicUrl,
                            validator: ValidatorFactory.getValidator(
                                'image url',
                                fieldRequired: false,
                                upperLimit: 300),
                          ),
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 7.2 / 10,
                      child: FormFieldContainer(
                          SquareButton('Confirm changes', () {
                        if (_formKey.currentState.validate()) {
                          _controller.updateUser(
                              _loggedInUser,
                              fullNameController.text,
                              descriptionController.text,
                              profilePicUrl.text,
                              backgroundPicUrl.text);
                          _refreshProfileState();
                          Navigator.pop(context);
                        }
                      })),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
