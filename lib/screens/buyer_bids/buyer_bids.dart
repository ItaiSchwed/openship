import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:openship/comstants.dart';
import 'package:openship/screens/login/user_id.dart';
import 'package:openship/swagger_classes/bid.dart';
import 'package:openship/swagger_classes/dimensions.dart';
import 'package:openship/swagger_classes/sale.dart';
import 'package:openship/swagger_classes/shipment.dart';
import 'package:http/http.dart' as http;
import 'package:openship/swagger_classes/user.dart';
import 'package:uuid/uuid.dart';

class BuyerBids extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BuyerBidsState();
}

class BuyerBidsState extends State<BuyerBids> {
  List<Sale> sales = [];
  List<Bid> bids = [];
  @override
  void initState() {
    _initializeBids();
    _initializeSales();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BIDS'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return GestureDetector(
//            todo: onTap: _generateOnTapBid(shipments[position].id),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                  child: Text(
                    "  Shipment Id: " + bids[position].shipmentId,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _getIconBySale(bids[position].shipmentId)),
                    ],
                  ),
                ),
                Divider(
                  height: 2.0,
                  color: Colors.grey,
                )
              ],
            ),
          );
        },
        itemCount: bids.length,
      ),
    );
  }

  void _initializeBids() async {
    final response = await http.get(
        Constants.baseUrl + Constants.bidsUrl + '?buyerId=${UserId().userId}');

    setState(() {
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        bids = json
            .decode(response.body)
            .map((bid) => Bid.fromJson(bid))
            .toList()
            .cast<Bid>();
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }
    });
  }

  void _initializeSales() async {
    final response = await http.get(
        Constants.baseUrl + Constants.salesUrl + '?buyerId=${UserId().userId}');
    setState(() {
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        sales = json
            .decode(response.body)
            .map((sale) => Sale.fromJson(sale))
            .toList()
            .cast<Sale>();
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }
    });
  }

  _getIconBySale(String shipmentId) {

  }
}
