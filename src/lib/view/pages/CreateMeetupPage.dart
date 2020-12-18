import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/Post.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/pages/MeetupPage.dart';
import 'package:confnect/view/widgets/meetup/meetupforms/DescriptionForm.dart';
import 'package:confnect/view/widgets/meetup/meetupforms/MeetupDateTimeForum.dart';
import 'package:confnect/view/widgets/meetup/meetupforms/LocationForm.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateMeetupPage extends StatefulPage {
  Post _post;
  Controller _controller;
  final Function _refreshPostPage;
  DateTime _meetDate = new DateTime.now();
  TimeOfDay _meetTime = new TimeOfDay.now();
  CreateMeetupPage(this._controller, this._post, this._refreshPostPage)
      : super(_controller, key: Key("CreateMeetupPage"));

  @override
  _CreateMeetupPageState createState() => _CreateMeetupPageState();
}

class _CreateMeetupPageState extends State<CreateMeetupPage> {
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void createMeetup(
      String location, DateTime date, TimeOfDay time, String description) {
    widget._controller.getDatabase().createMeetup(
        widget._post,
        location,
        date,
        time,
        description,
        widget._controller
            .getDatabase()
            .getUser(widget._controller.getLoggedInUserName()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Meetup"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  LocationForm(_locationController),
                  MeetupDateTimeForm(
                    widget._meetDate,
                    widget._meetTime,
                    (date) {
                      setState(() {
                        widget._meetDate = date;
                      });
                    },
                    (time) {
                      setState(() {
                        widget._meetTime = time;
                      });
                    },
                  ),
                  DescriptionForum(_descriptionController),
                ],
              ),
              FormFieldContainer(
                SquareButton('Submit', () {
                  String location = _locationController.text;
                  String description = _descriptionController.text;
                  if (_formKey.currentState.validate()) {
                    createMeetup(location, widget._meetDate, widget._meetTime,
                        description);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeetupPage(
                                widget._controller,
                                widget._post.getMeetup(),
                              )),
                    );
                    widget._refreshPostPage();
                  }
                }),
                key: Key("SubmitCreateMeetup"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
