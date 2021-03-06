import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/model/Date.dart';
import 'package:confnect/model/User.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddComment extends StatefulWidget {
  Controller _controller;
  final void Function(User user, Date date, String text) onSubmitted;

  AddComment(this._controller, {this.onSubmitted});
  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleSubmitted(String text) {
    String username = widget._controller.getLoggedInUserName();
    User user = widget._controller.getDatabase().getUser(username);
    Date date = new Date(DateTime.now());
    widget.onSubmitted(user, date, text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: _textController,
                    validator: ValidatorFactory.getValidator('Message',
                        fieldRequired: true),
                    decoration:
                        InputDecoration.collapsed(hintText: 'Send a message'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _handleSubmitted(_textController.text);
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
