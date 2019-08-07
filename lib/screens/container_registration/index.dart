import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:openship/Components/date_picker.dart';


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
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  String departurePort = '';
  DateTime departures = DateTime.now();
  DateTime arrives = DateTime.now();
  final formatter = new DateFormat('dd-MM-yyyy');

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
                  ),
                  new TextField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.subdirectory_arrow_left),
                      hintText: 'Enter your destination port',
                      labelText: 'Destination port',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  new TextField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.crop_free),
                      hintText: 'Enter free space in digits',
                      labelText: 'Container free space :',
                    ),
                    keyboardType: TextInputType.phone,
//                    inputFormatters: [
//                      WhitelistingTextInputFormatter.digitsOnly,
//                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 20.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        DatePicker((DateTime pickedTime) {
                          setState(() {
                            departures = pickedTime;
                          });
                        }, label: 'Departures date'),
                         Text(formatter.format(departures)),
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
                            arrives = pickedTime;
                          });
                        }, label: 'Arrival date'),
                        Text(formatter.format(arrives)),
                      ],
                    ),
                  ),


                  new TextField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.attach_money),
                      hintText: 'Enter cost per regel',
                      labelText: 'Cost per regel:',
                    ),
                  ),

                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: _submitForm(context),
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
          title: Text('Not in stock'),
          content: const Text('This item is no longer available'),
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

  Function _submitForm(BuildContext context) {
    //TODO: _submitForm

    return () => _ackAlert(context);
  }
}
