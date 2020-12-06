import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/model/Meetup.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:flutter/material.dart';

class LocationFormSubmit extends StatefulWidget {
  Function _finishEditing;
  final _locationController = TextEditingController();
  Meetup _meetup;

  LocationFormSubmit(this._meetup, this._finishEditing);
  @override
  _LocationFormSubmitState createState() => _LocationFormSubmitState();
}

class _LocationFormSubmitState extends State<LocationFormSubmit> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      FormFieldContainer(
        FormTextField(
          "Location",
          widget._locationController,
          validator: ValidatorFactory.getValidator('Location',
              fieldRequired: true, upperLimit: 50),
        ),
        margin: EdgeInsets.all(0),
      ),
      InkWell(
        onTap: () {
          widget._meetup.setLocation(widget._locationController.text);
          widget._finishEditing();
        },
        child: Container(
          height: 45,
          color: Colors.black,
          child: Icon(
            Icons.done,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}
