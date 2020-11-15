import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/pages/UserSection.dart';
import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';

import 'package:flutter/material.dart';

class CreatePostInput extends StatelessWidget {
  final titleController = TextEditingController();
  final textController = TextEditingController();
  final Controller _controller;
  CreatePostInput(this._controller);

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FormFieldContainer(FormTextField(
        'Title',
        titleController,
      )),
      FormFieldContainer(
          FormTextField(
            'Text',
            textController,
            maxLines: 15,
          ),
          height: 200,
          margin: EdgeInsets.only(top: 0, bottom: 20)),
      FormFieldContainer(
        SquareButton('Submit', () {
          String title = titleController.text, text = textController.text;
          this
              ._controller
              .setAddingPost(!this._controller.createPost(title, text));

          //might need improvement
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>
                      new UserSection(this._controller, index: 3)));
        }),
      )
    ]);
  }
}
