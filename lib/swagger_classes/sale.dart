class Sale{
  final String id;
  final String buyerId;
  final String sellerId;
  final String shipmentId;
  final String bidId;

  Sale({this.id, this.buyerId, this.sellerId, this.shipmentId, this.bidId});

  factory Sale.fromJson(Map<String, dynamic> shipmentJson) {
    return Sale(
      id: shipmentJson['id'],
      buyerId: shipmentJson['buyerId'],
      sellerId: shipmentJson['sellerId'],
      shipmentId: shipmentJson['shipmentId'],
      bidId: shipmentJson['bidId'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["buyerId"] = buyerId;
    map["sellerId"] = sellerId;
    map["shipmentId"] = shipmentId;
    map["bidId"] = bidId;
    return map;
  }
}