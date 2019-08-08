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
}