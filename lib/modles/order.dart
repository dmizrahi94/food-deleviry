
/// UserModel.dart
import 'dart:convert';

Order clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Order.fromMap(jsonData);
}

String clientToJson(Order data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Order {
  int id;
  String userId;
  String resturantId;
  int status;

  Order({
    this.id,
    this.userId,
    this.resturantId,
    this.status,
  });

  factory Order.fromMap(Map<String, dynamic> json) => new Order(
        id: json["id"],
        userId: json["user_id"],
        resturantId: json["resturant_id"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "resturant_id": resturantId,
        "status": status,
      };
}