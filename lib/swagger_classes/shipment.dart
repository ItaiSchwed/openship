import 'dart:convert';

import 'package:openship/comstants.dart';
import 'package:openship/screens/login/user_id.dart';
import 'package:openship/swagger_classes/dimensions.dart';
import 'package:uuid/uuid.dart';

class Shipment {
  final String id;
  final String sellerId;
  final String srcPort;
  final String dstPort;
  final Dimensions dimensions;
  final int price;
  final DateTime departDate;
  final DateTime arriveDate;

  Shipment({this.id, this.sellerId, this.srcPort, this.dstPort, this.dimensions, this.price, this.departDate, this.arriveDate}){
    UserId().userId = Uuid().v4();
  }

  factory Shipment.fromJson(Map<String, dynamic> shipmentJson) {
    return Shipment(
      id: shipmentJson['id'],
      sellerId: shipmentJson['sellerId'],
      srcPort: shipmentJson['srcPort'],
      dstPort: shipmentJson['dstPort'],
      dimensions: Dimensions.fromJson(shipmentJson['dimensions']),
      price: shipmentJson['price'],
      departDate: DateTime.parse(shipmentJson['departDate'].toString()),
      arriveDate: DateTime.parse(shipmentJson['arriveDate'].toString()),
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["sellerId"] = sellerId;
    map["srcPort"] = srcPort;
    map["dstPort"] = dstPort;
    map["dimensions"] = dimensions.toMap();
    map["price"] = price;
    map["departDate"] = Constants.sendFormatter.format(departDate);
    map["arriveDate"] = Constants.sendFormatter.format(arriveDate);
    return map;
  }
}