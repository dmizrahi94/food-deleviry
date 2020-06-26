/// UserModel.dart
import 'dart:convert';

User clientFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromMap(jsonData);
}

String clientToJson(User data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class User {
  int id;
  String firstName;
  String lastName;
  String userId;
  String password;
  String address;
  String phoneNumber;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.userId,
    this.password,
    this.address,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> json) => new User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userId: json["user_id"],
        password: json["password"],
        address: json["address"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "user_id": userId,
        "password": password,
        "address": address,
        "phone_number": phoneNumber,
      };
}
