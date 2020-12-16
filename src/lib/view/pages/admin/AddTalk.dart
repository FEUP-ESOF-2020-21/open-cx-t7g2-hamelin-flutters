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

class AddTalk extends StatefulPage {
  final Function _onTalkAdded;
  AddTalk(Controller controller, this._onTalkAdded, {Key key})
      : super(controller, key: key);

  @override
  State<AddTalk> createState() {
    return _AddTalkState(super.getController(), _onTalkAdded);
  }
}

class _AddTalkState extends State<AddTalk> {
  final Controller _controller;
  final Function _onTalkAdded;

  final talkTitleController = TextEditingController();
  final talkDescriptionController = TextEditingController();
  final speakerUsernameController = TextEditingController();
  final talkImageURLController = TextEditingController();
  final tagNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Tag> _selectedTags;

  @override
  void initState() {
    _selectedTags = [];
    super.initState();
  }

  @override
  void dispose() {
    _selectedTags.clear();
    super.dispose();
  }

  _AddTalkState(this._controller, this._onTalkAdded);

  @override
  Widget build(BuildContext context) {
    Database db = _controller.getDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Talk",
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
                    'Talk Title',
                    talkTitleController,
                    validator: ValidatorFactory.getValidator(
                      'Title',
                      fieldRequired: true,
                      lowerLimit: 10,
                      upperLimit: 50,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                ),
                TagManager.tagSelector(_controller, _selectedTags),
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
                        } else if (!db.hasRole(_controller.getConference(),
                            value, UserRole.HOST)) {
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
                      if (_selectedTags.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Talk addition error"),
                              content: new Text(
                                  "You haven't selected any tags! Select at least 1."),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (_formKey.currentState.validate()) {
                        String talkTitle = talkTitleController.text,
                            talkDescription = talkDescriptionController.text,
                            talkSpeakerUsername =
                                speakerUsernameController.text,
                            talkImageURL = talkImageURLController.text;

                        Function onComplete = (newTags) {
                          db.addTalk(_controller.getConference(), talkTitle, talkDescription,
                              talkSpeakerUsername, talkImageURL, newTags);
                          _onTalkAdded();
                          Navigator.pop(context);
                        };

                        TagManager.getTagInfo(
                            context, db, _selectedTags, onComplete);
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
