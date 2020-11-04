import 'package:flutter/material.dart';

class StandardDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.black,
      thickness: 1.5,
      indent: 50,
      endIndent: 50,
    );
  }
}
