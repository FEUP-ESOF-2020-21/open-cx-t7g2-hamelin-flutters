import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final double scaleFactor;
  final bool white;
  PageTitle(this.text, {this.margin, this.scaleFactor, this.white = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin == null
          ? EdgeInsets.only(
              top: 60,
            )
          : this.margin,
      child: Text(
        this.text,
        textScaleFactor: scaleFactor != null ? scaleFactor : 1.5,
        style: this.white
            ? pageTitleTextStyle.copyWith(color: Colors.white)
            : pageTitleTextStyle,
      ),
    );
  }
}
