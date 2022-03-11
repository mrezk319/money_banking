import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.country,
    required this.balance,
  });
  String id;
  String name;
  String email;
  String phone;
  String country;
  double balance;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    country: json["country"],
    balance: json["balance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name": name,
    "email": email,
    "phone": phone,
    "country": country,
    "balance": balance,
  };
}
