import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final Function fn;
  final bool white;
  SquareButton(this.text, this.fn, {this.white = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.text,
          style: TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 1.1),
      onPressed: fn,
      style: ButtonStyle(
        backgroundColor: white
            ? MaterialStateProperty.all<Color>(Colors.white)
            : MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: white
            ? MaterialStateProperty.all<Color>(Colors.black)
            : MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.of(context).size.width - 60, 50),
        ),
      ),
    );
  }
}
