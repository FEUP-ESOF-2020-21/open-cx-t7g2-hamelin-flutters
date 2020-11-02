import 'package:flutter/material.dart';

class TextOnlyButton extends StatelessWidget {
  final String text;
  final Function fn;
  TextOnlyButton(this.text, this.fn);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: this.fn,
        child: Text(
          this.text,
          style: TextStyle(
            //fontFamily: for another font,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
