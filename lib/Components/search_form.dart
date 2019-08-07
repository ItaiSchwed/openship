import 'package:flutter/material.dart';
import 'package:openship/Components/date_picker.dart';

class SearchForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DatePicker(
                (DateTime pickedTime){
          dateTime = pickedTime;
        }, label: 'departures later then'),
        TextField(
          decoration: InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
