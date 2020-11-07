import 'package:confnect/view/style/DescriptionTextWidget.dart';
import 'package:flutter/material.dart';

class TextSectionPost extends StatelessWidget {
  final String _title;
  final String _description;
  TextSectionPost(this._title, this._description);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          //padding: EdgeInsets.all((5.0)),
          child: Text(
            _title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        DescriptionTextWidget(text: _description)
      ],
    );
  }
}
