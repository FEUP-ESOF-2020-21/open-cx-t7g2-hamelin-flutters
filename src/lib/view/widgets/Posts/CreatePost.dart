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
  final int _forumId;
  CreatePostInput(this._controller, this._forumId);

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
          height: MediaQuery.of(context).size.height / 4,
          margin: EdgeInsets.only(top: 0, bottom: 20)),
      FormFieldContainer(
        SquareButton('Submit', () {
          String title = titleController.text, text = textController.text;
          if (this._controller.createPost(this._forumId, title, text)) {
            this._controller.changeAddingPost();
            Navigator.pop(context);
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new UserSection(
                          this._controller,
                          index: 0,
                        )));
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Error adding post.'),
                duration: Duration(seconds: 2),
              ),
            );
            //this._controller.setAddingPost(true);
          }
        }),
      )
    ]);
  }
}
