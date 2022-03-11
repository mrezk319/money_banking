import 'dart:convert';

Transfer transferFromJson(String str) => Transfer.fromJson(json.decode(str));

String transferToJson(Transfer data) => json.encode(data.toJson());

class Transfer {
  Transfer({
    required this.sender,
    required this.receiver,
    required this.balance,
  });

  String sender;
  String receiver;
  double balance;

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
    sender: json["sender"],
    receiver: json["receiver"],
    balance: json["balance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "sender": sender,
    "receiver": receiver,
    "balance": balance,
  };
}