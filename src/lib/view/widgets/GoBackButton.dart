import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final Function fn;
  final EdgeInsets margin;
  GoBackButton({this.fn, this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: margin == null
          ? EdgeInsets.only(top: 50.0, left: 15.0, bottom: 100)
          : margin,
      child: IconButton(
        icon: Icon(Icons.keyboard_return),
        onPressed: this.fn == null
            ? () {
                Navigator.pop(context);
              }
            : this.fn,
      ),
    );
  }
}
