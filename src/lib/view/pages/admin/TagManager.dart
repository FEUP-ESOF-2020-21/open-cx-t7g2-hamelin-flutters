import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

class TagManager {
  static List<Tag> getTags(Controller _controller, String value) {
    print("getTags");
    Database db = _controller.getDatabase();
    return db
        .getTags()
        .where(
            (tag) => tag.getName().toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  static Widget tagSelector(Controller _controller, List<Tag> _selectedTags) {
    Database db = _controller.getDatabase();
    return FormFieldContainer(
      FlutterTagging<Tag>(
        initialItems: _selectedTags,
        enableImmediateSuggestion: true,
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
              borderSide: BorderSide(
                width: 3,
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
              borderSide: BorderSide(
                width: 3,
                color: Colors.black,
              ),
            ),
            hintText: 'Search Tags',
            labelText: 'Tags',
            labelStyle: TextStyle(color: Colors.black54),
            contentPadding: EdgeInsets.all(10),
          ),
        ),
        findSuggestions: (String value) {
          return getTags(_controller, value);
        },
        additionCallback: (value) {
          print("additionCallback, value: " + value);
          return db.createTag(
            value,
          );
        },
        configureSuggestion: (tag) {
          return SuggestionConfiguration(
            title: Text(tag == null ? "No tag found" : tag.getName()),
            additionWidget: Chip(
              avatar: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              label: Text('Add New Tag'),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
              backgroundColor: Colors.blue[800],
            ),
          );
        },
        configureChip: (tag) {
          return ChipConfiguration(
            label: Text(tag.getName()),
            backgroundColor: Colors.blue[800],
            labelStyle: TextStyle(color: Colors.white),
            deleteIconColor: Colors.white,
          );
        },
      ),
    );
  }

  static Future<void> getTagInfo(BuildContext context, Database db,
      List<Tag> tags, Function onComplete) async {
    final List<Tag> invalidTags = List<Tag>();
    for (int i = 0; i < tags.length; i++) {
      final Tag tag = tags[i];
      if (!db.isTagNew(tag)) continue;

      invalidTags.add(tag);

      final tagDescriptionController = TextEditingController();
      final tagCoverImageController = TextEditingController();
      final formKey = GlobalKey<FormState>();

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "Add tag '" + tag.getName() + "'",
              textScaleFactor: 1.3,
            ),
            content: Column(
              children: [
                Form(
                  key: formKey,
                  child: Container(
                    child: Column(
                      children: [
                        FormFieldContainer(
                          FormTextField(
                            'Description',
                            tagDescriptionController,
                            validator: ValidatorFactory.getValidator(
                              'Description',
                              fieldRequired: true,
                              lowerLimit: 10,
                              upperLimit: 70,
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        ),
                        FormFieldContainer(
                          FormTextField(
                            'Cover Image URL',
                            tagCoverImageController,
                            validator: ValidatorFactory.getValidator(
                              'Cover Image URL',
                              fieldRequired: true,
                              upperLimit: 300,
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Add"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    tag.setCoverImageURL(tagCoverImageController.text);
                    tag.setDescription(tagDescriptionController.text);
                    invalidTags.remove(tag);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        },
      );
    }

    invalidTags.forEach((t) {
      print("Removing invalid tag '" + t.getName() + "'");
      tags.remove(t);
    });
    onComplete(tags);
  }
}
