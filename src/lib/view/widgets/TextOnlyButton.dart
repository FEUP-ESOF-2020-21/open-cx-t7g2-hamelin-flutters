import 'package:flutter/material.dart';

class TextOnlyButton extends StatelessWidget {
  final String text;
  final Widget child;
  final Function _fn;
  TextOnlyButton(this._fn, {this.text, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: this._fn,
        child: this.child == null
            ? Text(
                this.text,
                style: TextStyle(
                  //fontFamily: for another font,
                  color: Colors.black,
                ),
              )
            : this.child,
      ),
    );
  }
}
