import 'package:confnect/view/style/TextStyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoleSelection extends StatefulWidget {
  bool attendee = true;
  RoleSelection({Key key}) : super(key: key);

  bool getRole() => attendee;

  @override
  _RoleSelectionState createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  @override
  Widget build(BuildContext context) {
    print(widget.attendee);
    return Row(children: [
      Expanded(
          child: Card(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            widget.attendee = true;
            setState(() {});
          },
          child: Container(
              child: Text("Attendee",
                  textAlign: TextAlign.center, style: talkCodeTextStyle),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: selectedDecoration(widget.attendee)),
        ),
      )),
      Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: () {
              widget.attendee = false;
              setState(() {});
            },
            child: Container(
                child: Text("Host",
                    textAlign: TextAlign.center, style: talkCodeTextStyle),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: selectedDecoration(!widget.attendee)),
          ),
        ),
      )
    ]);
  }

  BoxDecoration selectedDecoration(bool param) {
    if (param)
      return BoxDecoration(
        border: Border.all(color: Colors.green, width: 2.5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );
    else
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );
  }
}
