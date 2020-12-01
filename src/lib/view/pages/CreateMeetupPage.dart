import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/pages/MeetupPage.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:confnect/view/widgets/forms/DateTimeForm.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:flutter/material.dart';

class CreateMeetupPage extends StatefulPage {
  Post _post;
  Controller _controller;
  CreateMeetupPage(this._controller, this._post) : super(_controller);

  @override
  _CreateMeetupPageState createState() => _CreateMeetupPageState();
}

class _CreateMeetupPageState extends State<CreateMeetupPage> {
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _timeKey = GlobalKey<FormState>();
  void createMeetup(
      String location, DateTime date, TimeOfDay time, String description) {
    setState(() {
      date =
          new DateTime(date.year, date.month, date.day, time.hour, time.minute);
      widget._post.createMeetup(
          new Date(date),
          location,
          description,
          widget._controller
              .getDatabase()
              .getUser(widget._controller.getLoggedInUserName()));
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime meetDate = new DateTime.now();
    TimeOfDay meetTime = new TimeOfDay.now();
    //TODO Tirar este createMeetup quando a outra pagina atualizar
    createMeetup("", meetDate, meetTime,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra leo eget magna convallis, vitae lacinia tortor congue. Aenean condimentum odio ac pretium sollicitudin. In commodo porttitor ante eu luctus. Nam at massa eu dolor suscipit fermentum. Nunc at ipsum a lorem vehicula rutrum. Etiam tincidunt urna vitae mollis pharetra");
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Meetup"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                FormFieldContainer(
                  FormTextField("Location", _locationController),
                  margin: EdgeInsets.all(10),
                ),
                FormFieldContainer(
                  DateTimeForm(
                    key: _timeKey,
                    labelText: "Start Time",
                    selectedDate: new DateTime.now(),
                    selectedTime: new TimeOfDay.now(),
                    selectDate: (date) => {meetDate = date},
                    selectTime: (time) => {meetTime = time},
                  ),
                  margin: EdgeInsets.all(10),
                ),
                FormFieldContainer(
                  FormTextField(
                    "Description",
                    _descriptionController,
                    maxLines: 5,
                  ),
                  margin: EdgeInsets.all(10),
                ),
              ],
            ),
            FormFieldContainer(
              SquareButton('Submit', () {
                String location = _locationController.text;
                String description = _descriptionController.text;
                createMeetup(location, meetDate, meetTime, description);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MeetupPage(
                          widget._controller, widget._post.getMeetup())),
                );
                //Navigator.pop(context);
                //this._controller.setAddingPost(true);
              }),
            ),
          ],
        ));
  }
}
