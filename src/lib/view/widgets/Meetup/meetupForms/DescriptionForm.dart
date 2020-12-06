import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:flutter/material.dart';

class DescriptionForum extends StatefulWidget {
  final _descriptionController;

  DescriptionForum(this._descriptionController);
  @override
  _DescriptionForumState createState() => _DescriptionForumState();
}

class _DescriptionForumState extends State<DescriptionForum> {
  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      FormTextField(
        "Description",
        widget._descriptionController,
        validator: ValidatorFactory.getValidator('Description',
            fieldRequired: true, upperLimit: 300),
        maxLines: 5,
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
