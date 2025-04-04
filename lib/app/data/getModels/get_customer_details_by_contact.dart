// To parse this JSON data, do
//
//     final getCustomerDetailsByContactNumberModel = getCustomerDetailsByContactNumberModelFromJson(jsonString);

import 'dart:convert';

GetCustomerDetailsByContactNumberModel
    getCustomerDetailsByContactNumberModelFromJson(String str) =>
        GetCustomerDetailsByContactNumberModel.fromJson(json.decode(str));

String getCustomerDetailsByContactNumberModelToJson(
        GetCustomerDetailsByContactNumberModel data) =>
    json.encode(data.toJson());

class GetCustomerDetailsByContactNumberModel {
  final Data? data;

  GetCustomerDetailsByContactNumberModel({
    this.data,
  });

  factory GetCustomerDetailsByContactNumberModel.fromJson(
          Map<String, dynamic> json) =>
      GetCustomerDetailsByContactNumberModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? phoneNumber;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.phoneNumber,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
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
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
