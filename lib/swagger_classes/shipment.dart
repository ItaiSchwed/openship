import 'dart:convert';

import 'package:openship/swagger_classes/dimensions.dart';

class Shipment {
  final String id;
  final String sellerId;
  final String srcPort;
  final String dstPort;
  final Dimensions dimensions;
  final int price;
  final DateTime departDate;
  final DateTime arriveDate;

  Shipment({this.id, this.sellerId, this.srcPort, this.dstPort, this.dimensions, this.price, this.departDate, this.arriveDate});

  factory Shipment.fromJson(Map<String, dynamic> shipmentJson) {
    return Shipment(
      id: shipmentJson['id'],
      sellerId: shipmentJson['sellerId'],
      srcPort: shipmentJson['srcPort'],
      dstPort: shipmentJson['dstPort'],
      dimensions: Dimensions.fromJson(shipmentJson['dimensions']),
      price: int.parse(shipmentJson['price']),
      departDate: DateTime.parse(shipmentJson['departDate'].toString()),
      arriveDate: DateTime.parse(shipmentJson['arriveDate'].toString()),
    );
  }
}