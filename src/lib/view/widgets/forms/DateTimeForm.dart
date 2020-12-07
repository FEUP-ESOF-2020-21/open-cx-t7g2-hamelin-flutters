import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DateTimeForm extends StatefulWidget {
  DateTimeForm(
      {Key key,
      this.labelText,
      this.selectedDate,
      this.selectedTime,
      this.selectDate,
      this.selectTime,
      this.refresh})
      : super(key: key);

  final String labelText;
  DateTime selectedDate;
  TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;
  final ValueChanged<TimeOfDay> selectTime;
  final Function refresh;
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: widget.selectedDate,
        firstDate: new DateTime(1970, 8),
        lastDate: new DateTime(2101));
    if (picked != null && picked != widget.selectedDate)
      widget.selectDate(picked);
    widget.selectedDate = picked;
    setState(() {});
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context, initialTime: widget.selectedTime);
    if (picked != null && picked != widget.selectedTime) {
      widget.selectTime(picked);
      widget.selectedTime = picked;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.body1;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: new _InputDropdown(
            labelText: widget.labelText,
            valueText: new DateFormat.yMMMd().format(widget.selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
        new Expanded(
          flex: 3,
          child: new _InputDropdown(
            valueText: widget.selectedTime.format(context),
            valueStyle: valueStyle,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),
      ],
    );
  }
}

class _InputDropdown extends StatefulWidget {
  const _InputDropdown(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;
  @override
  __InputDropdownState createState() => __InputDropdownState();
}

class __InputDropdownState extends State<_InputDropdown> {
  @override
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: widget.onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: widget.labelText,
        ),
        baseStyle: widget.valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(widget.valueText, style: widget.valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}
