import 'dart:ui';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String fieldText;
  final bool obscureText;
  FormTextField(this.fieldText, {this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.obscureText,
      selectionWidthStyle: BoxWidthStyle.max,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 10.0,
          left: 10.0,
        ),
        hintText: this.fieldText,
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
