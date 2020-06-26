/// UserModel.dart
import 'dart:convert';

Resturant clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Resturant.fromMap(jsonData);
}

String clientToJson(Resturant data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Resturant {
  int id;
  String name;
  String cordinatex;
  String cordinatey;
  String address;

  Resturant({
    this.id,
    this.name,
    this.cordinatex,
    this.cordinatey,
    this.address,
  });

  factory Resturant.fromMap(Map<String, dynamic> json) => new Resturant(
        id: json["id"],
        name: json["name"],
        cordinatex: json["cordinate_x"],
        cordinatey: json["cordinate_y"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "cordinate_x": cordinatex,
        "cordinate_y": cordinatey,
        "address": address,
      };
}
