// To parse this JSON data, do
//
//     final customerContacts = customerContactsFromJson(jsonString);

import 'dart:convert';

CustomerContacts customerContactsFromJson(String str) =>
    CustomerContacts.fromJson(json.decode(str));

String customerContactsToJson(CustomerContacts data) =>
    json.encode(data.toJson());

class CustomerContacts {
  final List<Contacts>? data;

  CustomerContacts({
    this.data,
  });

  factory CustomerContacts.fromJson(Map<String, dynamic> json) =>
      CustomerContacts(
        data: json["data"] == null
            ? []
            : List<Contacts>.from(json["data"]!.map((x) => Contacts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Contacts {
  final int? id;
  final String? phoneNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Contacts({
    this.id,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        id: json["id"],
        phoneNumber: json["phone_number"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
