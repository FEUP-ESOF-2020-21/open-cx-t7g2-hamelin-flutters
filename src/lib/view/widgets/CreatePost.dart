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
          height: 190,
          margin: EdgeInsets.only(top: 0, bottom: 20)),
      FormFieldContainer(
        SquareButton('Submit', () {
          String title = titleController.text, text = textController.text;
          if (this._controller.createPost(title, text)) {
            this._controller.setAddingPost(false);
            Navigator.pop(context);
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new UserSection(
                          this._controller,
                          index: 3,
                        )));
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Error adding post.'),
                duration: Duration(seconds: 2),
              ),
            );
            this._controller.setAddingPost(true);
          }
        }),
      )
    ]);
  }
}
