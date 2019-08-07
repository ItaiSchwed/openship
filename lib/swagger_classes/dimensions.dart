class Dimensions {
  int width;
  int length;
  int height;

  Dimensions({this.width, this.length, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
        width: int.parse(json['width']),
        length: int.parse(json['length']),
        height: int.parse(json['height']),
    );
  }
}