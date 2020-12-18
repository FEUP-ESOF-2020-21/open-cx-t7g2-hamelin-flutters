import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:flutter/material.dart';

class LocationForm extends StatefulWidget {
  final _locationController;

  LocationForm(this._locationController)
      : super(key: Key('LocationMeetupForm'));
  @override
  _LocationFormState createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      FormTextField(
        "Location",
        widget._locationController,
        validator: ValidatorFactory.getValidator('Location',
            fieldRequired: true, upperLimit: 50),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
