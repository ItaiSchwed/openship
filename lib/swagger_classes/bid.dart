import 'dart:convert';

import 'package:openship/swagger_classes/dimensions.dart';

class Bid{
  final String id;
  final String buyerId;
  final String shipmentId;
  final Dimensions dimensions;

  Bid({this.id, this.buyerId, this.shipmentId, this.dimensions});

  factory Bid.fromJson(Map<String, dynamic> shipmentJson) {
    return Bid(
      id: shipmentJson['id'],
      buyerId: shipmentJson['buyerId'],
      shipmentId: shipmentJson['shipmentId'],
      dimensions: Dimensions.fromJson(json.decode(shipmentJson['dimensions'])),
    );
  }
}