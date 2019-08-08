import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:openship/Components/date_picker.dart';
import 'package:openship/comstants.dart';
import 'package:openship/screens/login/user_id.dart';
import 'package:openship/swagger_classes/shipment.dart';
import 'dart:math';
import 'package:openship/swagger_classes/dimensions.dart';

import 'package:uuid/uuid.dart';

class ContainerRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Container Registration',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Container Registration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title}){
    UserId().userId = Uuid().v4();
  }
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  String departurePort = '';
  String destinationPort = '';
  String freeSpace = "0";
  DateTime departuresDate = DateTime.now();
  DateTime arrivesDate = DateTime.now();
  int cost = -1;
  final formatter = new DateFormat('dd-MM-yyyy');
  var rng = new Random();

  String desirableArea;
  Shipment shipingData;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.subdirectory_arrow_right),
                      hintText: 'Enter your departure port',
                      labelText: 'Departure port  :',
                    ),
                    onChanged: (String text) {
                      setState(() {
                        departurePort = text;
                      });
                    },
                  ),
                  new TextField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.subdirectory_arrow_left),
                      hintText: 'Enter your destination port',
                      labelText: 'Destination port',
                    ),
                    onChanged: (String text) {
                      setState(() {
                        destinationPort = text;
                      });
                    },
                    keyboardType: TextInputType.datetime,
                  ),
                  new TextField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.crop_free),
                      hintText: 'Enter free space in digits',
                      labelText: 'Container free space :',
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (String text) {
                      setState(() {
                        freeSpace = text;
                      });
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20, right: 20.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        DatePicker((DateTime pickedTime) {
                          setState(() {
                            departuresDate = pickedTime;
                          });
                        }, label: 'Departures date'),
                        Text(formatter.format(departuresDate)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        DatePicker((DateTime pickedTime) {
                          setState(() {
                            arrivesDate = pickedTime;
                          });
                        }, label: 'Arrival date'),
                        Text(formatter.format(arrivesDate)),
                      ],
                    ),
                  ),
                  new TextField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.attach_money),
                      hintText: 'Enter cost per regel',
                      labelText: 'Cost per regel:',
                    ),
                    onChanged: (String text) {
                      setState(() {
                        cost = int.parse(text);
                      });
                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: _generateSubmitForm(context),
                      )),
                ],
              ))),
    );
  }

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Great man!'),
          content: const Text('You successfuly added your container!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Shipment> createPost(String url, {Map body}) async {
    Map<String, String> headers = {"Content-type":"application/json"};
    http.post(url, body: json.encode(body), headers: headers);
  }

  Function _generateSubmitForm(BuildContext context) {
    return () {
      shipingData = new Shipment(
          id: Uuid().v4(),
          sellerId: UserId().userId,
          srcPort: departurePort,
          dstPort: destinationPort,
          dimensions:
              new Dimensions(width: 0, length: int.parse(freeSpace), height: 0),
          price: cost,
          departDate: departuresDate,
          arriveDate: arrivesDate);

      createPost(Constants.baseUrl + Constants.shipmentsUrl,
          body: shipingData.toMap());
      return _ackAlert(context);
    };
  }
}
