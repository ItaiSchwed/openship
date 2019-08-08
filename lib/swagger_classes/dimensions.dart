class Dimensions {
  int width;
  int length;
  int height;

  Dimensions({this.width, this.length, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
        width: json['width'],
        length: json['length'],
        height: json['height'],
    );
  }
}