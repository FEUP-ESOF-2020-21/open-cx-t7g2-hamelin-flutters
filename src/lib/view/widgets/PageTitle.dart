import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final double scaleFactor;
  PageTitle(this.text, {this.margin, this.scaleFactor});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: this.margin == null
          ? EdgeInsets.only(
              top: 60,
              left: 30.0,
            )
          : this.margin,
      child: Text(
        this.text,
        textScaleFactor: scaleFactor != null ? scaleFactor : 1.5,
        style: pageTitleTextStyle,
      ),
    );
  }
}
