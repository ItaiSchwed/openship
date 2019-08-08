import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openship/Components/date_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:openship/comstants.dart';
import 'package:openship/screens/login/user_id.dart';
import 'package:openship/swagger_classes/bid.dart';
import 'package:openship/swagger_classes/shipment.dart';
import 'package:uuid/uuid.dart';

class SearchForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  String source;
  String destination;
  DateTime departures = DateTime.now();
  DateTime arrives = DateTime.now();
  int desirableArea = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: TextField(
            onChanged: (String text) {
              setState(() {
                source = text;
              });
            },
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
            onChanged: (String text) {
              setState(() {
                destination = text;
              });
            },
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
              Text(Constants.showFormatter.format(departures)),
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
              Text(Constants.showFormatter.format(arrives)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (String text) {
                    setState(() {
                      desirableArea = int.parse(text);
                    });
                  },
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text('  sq. ft'),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Center(
              child: GestureDetector(
                onTap: _onTapSearch,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Search'),
                    Icon(Icons.search),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  void _onTapSearch() async {
    final response = await http.get(Constants.baseUrl +
        Constants.shipmentsUrl +
        '?departDate=${Constants.sendFormatter.format(departures)}' +
        ',arriveDate=${Constants.sendFormatter.format(arrives)}' +
        ',srcPort=$source' +
        ',dstPort=$destination');
    //todo: desirable area

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List<Shipment> shipments = json
          .decode(response.body)
          .map((shipment) => Shipment.fromJson(shipment))
          .toList()
          .cast<Shipment>();
      Navigator.pushNamed(context, '/buyer_shipments',
          arguments: {'bidDimensions': desirableArea, 'shipments': shipments});
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
