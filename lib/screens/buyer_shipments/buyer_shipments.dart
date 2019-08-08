import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:openship/comstants.dart';
import 'package:openship/swagger_classes/shipment.dart';
import 'package:http/http.dart' as http;
import 'package:openship/swagger_classes/user.dart';

class BuyerShipments extends StatelessWidget {
  final List<Shipment> shipments;
  List<User> users;

  BuyerShipments(this.shipments) {
    initializeIdsToNames();
  }

  Future initializeIdsToNames() async {
    var usersResponse =
        await http.get(Constants.baseUrl + Constants.shipmentsUrl);
    users = json
        .decode(usersResponse.body)
        .map((user) => User.fromJson(user))
        .toList()
        .cast<User>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: shipments
          .map((Shipment shipment) => Card(
                  child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('arrival time: ${Constants.showFormatter.format(shipment.arriveDate)}'),
                      Text('price: ${shipment.price}'),
                    ],
                  ),
                  Text('name: ${getName(shipment.sellerId)}'),
                ],
              )))
          .toList()
          .cast<Widget>(),
    ));
  }

  String getName(String sellerId) {
    return users.firstWhere((User user) => user.id == sellerId).name;
  }
}
