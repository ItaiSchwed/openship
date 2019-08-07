import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  State createState() => _DatePickerState();
}

//State is information of the application that can change over time or when some actions are taken.
class _DatePickerState extends State<DatePicker>{

  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2020)
    );
    if(picked != null) setState(() => _value = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              RaisedButton(onPressed: _selectDate, child: Text('Click me'),)
            ],
          ),
        ),
    );
  }
}
