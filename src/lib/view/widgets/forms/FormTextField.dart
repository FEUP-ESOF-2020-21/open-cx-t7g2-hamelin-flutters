import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String _fieldText;
  final bool obscureText;
  final Function validator;
  final int maxLines;
  final String initialValue;
  final TextEditingController _controller;
  FormTextField(this._fieldText, this._controller,
      {this.obscureText = false,
      this.validator,
      this.maxLines = 1,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.initialValue,
      obscureText: this.obscureText,
      controller: this._controller,
      validator: this.validator,
      maxLines: this.maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 20.0,
          left: 10.0,
        ),
        hintText: this._fieldText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: BorderSide(
            width: 3,
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: BorderSide(
            width: 3,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
