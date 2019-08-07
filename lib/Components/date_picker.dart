import 'package:flutter/material.dart';

typedef DateListener = void Function(DateTime pickedTime);

class DatePicker extends StatefulWidget {
  final DateListener dateListener;
  final String label;

  DatePicker(this.dateListener, {this.label});

  @override
  State createState() => _DatePickerState();
}

//State is information of the application that can change over time or when some actions are taken.
class _DatePickerState extends State<DatePicker> {
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2030));
    if (picked != null) setState(() => widget.dateListener(picked));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(right: 13,),
            child: Icon(
              Icons.date_range,
              color: Colors.grey,
              size: 28,
            ),
          ),
          Text(
            widget.label + " ",
            style:
                TextStyle(fontSize: 17.0, color: Colors.black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
