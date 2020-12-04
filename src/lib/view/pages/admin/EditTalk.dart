import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:confnect/model/Talk.dart';
import 'package:flutter/material.dart';

import 'TagManager.dart';

class EditTalk extends StatefulPage {
  final Function _onTalkEdited;
  final Talk _talk;
  EditTalk(Controller controller, this._onTalkEdited, this._talk, {Key key})
      : super(controller, key: key);

  @override
  State<EditTalk> createState() {
    return _EditTalkState(super.getController(), _onTalkEdited, _talk);
  }
}

class _EditTalkState extends State<EditTalk> {
  final Controller _controller;
  final Function _onTalkEdited;
  Talk _talk;

  final talkTitleController = TextEditingController();
  final talkDescriptionController = TextEditingController();
  final speakerUsernameController = TextEditingController();
  final talkImageURLController = TextEditingController();
  final tagNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Tag> _selectedTags;

  @override
  void initState() {
    _selectedTags = _talk.getTags();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _EditTalkState(this._controller, this._onTalkEdited, this._talk);

  void editTalk(BuildContext context, Database db) {
    if (_selectedTags.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Talk edition error"),
            content:
                new Text("You haven't selected any tags! Select at least 1."),
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
      // TODO: set minimum requirements
      String talkTitle = (talkTitleController.text == "")
              ? _talk.getTitle()
              : talkTitleController.text,
          talkDescription = (talkDescriptionController.text == "")
              ? _talk.getDescription()
              : talkDescriptionController.text,
          talkSpeakerUsername = (speakerUsernameController.text == "")
              ? _talk.getSpeaker().getUsername()
              : speakerUsernameController.text,
          talkImageURL = (talkImageURLController.text == "")
              ? _talk.getImageURL()
              : talkImageURLController.text;

      Function onComplete = (newTags) {
        db.editTalk(_talk.getId(), talkTitle, talkDescription,
            talkSpeakerUsername, talkImageURL, _selectedTags);
        _onTalkEdited();
        Navigator.pop(context);
      };

      TagManager.getTagInfo(context, db, _selectedTags, onComplete);
    }
  }

  @override
  Widget build(BuildContext context) {
    Database db = _controller.getDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Talk",
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
                    _talk.getTitle(),
                    talkTitleController,
                    validator: ValidatorFactory.getValidator(
                      'Title',
                      lowerLimit: 10,
                      upperLimit: 50,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                ),
                TagManager.tagSelector(_controller, _selectedTags),
                FormFieldContainer(
                  FormTextField(
                    _talk.getDescription(),
                    talkDescriptionController,
                    validator: ValidatorFactory.getValidator(
                      'Description',
                      lowerLimit: 20,
                      upperLimit: 75,
                    ),
                  ),
                ),
                FormFieldContainer(
                  FormTextField(
                    _talk.getSpeaker().getUsername(),
                    speakerUsernameController,
                    validator: ValidatorFactory.getValidator(
                      'Speaker username',
                      extender: (value) {
                        if (value != "") {
                          if (!db.existsUser(value)) {
                            return "User with username " +
                                value.toString() +
                                " doesn't exist";
                          } else if (!db.hasRole(value, UserRole.HOST)) {
                            return "User with username " +
                                value.toString() +
                                " doesn't have HOST role";
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                FormFieldContainer(
                  FormTextField(
                    _talk.getImageURL(),
                    talkImageURLController,
                    validator: ValidatorFactory.getValidator(
                      'Talk image url',
                    ),
                  ),
                ),
                FormFieldContainer(
                  SquareButton(
                    'Edit talk',
                    () {
                      editTalk(context, db);
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
