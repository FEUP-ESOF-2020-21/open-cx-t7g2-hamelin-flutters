import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;
  final double fontSize;

  DescriptionTextWidget({@required this.text, this.fontSize = 14});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void setState(fn) {
    super.setState(fn);

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return new Container(
      height: 80,
      child: ListView(
        children: [
          Container(
            padding: new EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
            child: secondHalf.isEmpty
                ? new Text(
                    firstHalf,
                    style: new TextStyle(fontSize: widget.fontSize),
                  )
                : new Column(
                    children: <Widget>[
                      new Text(
                        flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                        style: new TextStyle(fontSize: widget.fontSize),
                      ),
                      new InkWell(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Text(
                              flag ? "show more" : "show less",
                              style: new TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
