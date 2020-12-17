import 'package:flutter/material.dart';

class FormFieldContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final double height;
  final Key key;
  FormFieldContainer(this.child, {this.margin, this.height, this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        height: this.height,
        width: MediaQuery.of(context).size.width - 60,
        margin: this.margin == null
            ? EdgeInsets.only(bottom: 20.0, left: 30.0, right: 30.0)
            : this.margin,
        child: this.child);
  }
}
