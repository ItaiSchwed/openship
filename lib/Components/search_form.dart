import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:openship/Components/date_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:openship/swagger_classes/shipment.dart';

class SearchForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final formatter = new DateFormat('dd-mm-yyyy');
  DateTime departures = DateTime.now();
  DateTime arrives = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "source",
              hintText: "source",
              prefixIcon: Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "destination",
              hintText: "destination",
              prefixIcon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DatePicker((DateTime pickedTime) {
                setState(() {
                  departures = pickedTime;
                });
              }, label: 'departures later then'),
              Text(formatter.format(departures)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DatePicker((DateTime pickedTime) {
                setState(() {
                  arrives = pickedTime;
                });
              }, label: 'arrives earlier then'),
              Text(formatter.format(arrives)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "desirable area",
              hintText: "desirable area",
              prefixIcon: Icon(
                Icons.border_all,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Center(
              child: RaisedButton(onPressed: () async {
                final response = await http.get(
                    'http://ec2-18-185-92-47.eu-central-1.compute.amazonaws.com/shipments');
                if (response.statusCode == 200) {
                  // If server returns an OK response, parse the JSON.
                  List<Shipment> shipments = json
                      .decode(response.body)
                      .map((shipment) => Shipment.fromJson(shipment))
                      .toList().cast<Shipment>();
                  print('itai: ');
                  print(shipments);
                } else {
                  // If that response was not OK, throw an error.
                  throw Exception('Failed to load post');
                }
              }),
            )),
      ],
    );
  }
}
