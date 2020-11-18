import 'package:confnect/view/style/DescriptionTextWidget.dart';
import 'package:flutter/material.dart';

class TextSectionPost extends StatelessWidget {
  final String _title;
  final String _description;
  final bool _showMore;
  TextSectionPost(this._title, this._description, this._showMore);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text(
            _title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        (_showMore
            ? DescriptionTextWidget(text: _description)
            : Text(_description)),
      ],
    );
  }
}
