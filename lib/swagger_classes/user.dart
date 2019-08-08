class User{
  final String id;
  final String name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> shipmentJson) {
    return User(
      id: shipmentJson['id'],
      name: shipmentJson['name'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}