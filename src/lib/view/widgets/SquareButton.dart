import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final Function fn;
  SquareButton(this.text, this.fn);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.text),
      onPressed: fn,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.of(context).size.width - 60, 50),
        ),
      ),
    );
  }
}
