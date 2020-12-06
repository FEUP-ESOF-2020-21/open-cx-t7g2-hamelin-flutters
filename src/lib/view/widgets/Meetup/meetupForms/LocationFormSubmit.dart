import 'package:confnect/controller/ValidatorFactory.dart';

import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:flutter/material.dart';

class LocationFormSubmit extends StatefulWidget {
  final TextEditingController _locationController;

  LocationFormSubmit(this._locationController);
  @override
  _LocationFormSubmitState createState() => _LocationFormSubmitState();
}

class _LocationFormSubmitState extends State<LocationFormSubmit> {
  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      FormTextField(
        "Location",
        widget._locationController,
        validator: ValidatorFactory.getValidator('Location',
            fieldRequired: true, upperLimit: 50),
      ),
      margin: EdgeInsets.all(0),
    );
  }
}
