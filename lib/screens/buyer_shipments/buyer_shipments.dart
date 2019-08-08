import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:openship/comstants.dart';
import 'package:openship/screens/login/user_id.dart';
import 'package:openship/swagger_classes/bid.dart';
import 'package:openship/swagger_classes/dimensions.dart';
import 'package:openship/swagger_classes/shipment.dart';
import 'package:http/http.dart' as http;
import 'package:openship/swagger_classes/user.dart';
import 'package:uuid/uuid.dart';

class BuyerShipments extends StatelessWidget {
  final int bidDimensions;
  final List<Shipment> shipments;
  List<User> users;
  BuyerShipments(this.bidDimensions, this.shipments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('SHIPMENTS'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: _generateOnTapBid(shipments[position].id),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 12.0, 12.0, 6.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.date_range),
                                Text(
                                  "  Arrived Date: " +
                                      Constants.showFormatter.format(
                                          shipments[position].arriveDate),
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.attach_money),
                                Text(
                                  "  Price: " +
                                      shipments[position].price.toString(),
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              size: 35.0,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2.0,
                  color: Colors.grey,
                )
              ],
            ),
          );
        },
        itemCount: shipments.length,
      ),
    );
  }

  Function _generateOnTapBid(String shipmentId) {
    Bid bid = Bid(
        buyerId: UserId().userId,
        id: Uuid().v4(),
        shipmentId: shipmentId,
        dimensions: Dimensions(height: 0, length: bidDimensions, width: 0));
    Map<String, String> headers = {
      'Content-type' : 'application/json',
    };

    return () => http.post(Constants.baseUrl + Constants.bidsUrl,
        body: json.encode(bid.toMap()), headers: headers );
  }
}
