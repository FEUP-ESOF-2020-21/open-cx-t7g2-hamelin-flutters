import 'package:confnect/view/widgets/FormFieldContainer.dart';
import 'package:confnect/view/widgets/FormTextField.dart';

import 'package:flutter/material.dart';

class CreatePostInput extends StatelessWidget {
  Widget build(BuildContext context) {
    return FormFieldContainer(
      FormTextField(
        'Title',
        TextEditingController(),
      ),
    );
  }
}
