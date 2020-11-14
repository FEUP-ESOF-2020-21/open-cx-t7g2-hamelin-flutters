import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';

import 'package:flutter/material.dart';

class CreatePostInput extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FormFieldContainer(FormTextField(
        'Title',
        TextEditingController(),
      )),
      FormFieldContainer(
          FormTextField(
            'Text',
            TextEditingController(),
            maxLines: 15,
          ),
          height: 200,
          margin: EdgeInsets.only(top: 0, bottom: 20)),
      FormFieldContainer(
        SquareButton('Submit', () {
          //add content
        }),
      )
    ]);
  }
}
