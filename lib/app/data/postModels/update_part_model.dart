// To parse this JSON data, do
//
//     final updateVehicleModel = updateVehicleModelFromJson(jsonString);

import 'dart:convert';

UpdatePartModel updatePartModelFromJson(String str) =>
    UpdatePartModel.fromJson(json.decode(str));

String updatePartModelToJson(UpdatePartModel data) =>
    json.encode(data.toJson());

class UpdatePartModel {
  String? partId;
  String? name;
  String? make;
  String? model;
  String? condition;
  String? price;
  String? category;
  String? status;
  String? recievedAmount;
  String? balanceAmount;
  String? soldPrice;
  String? totalPrice;

  UpdatePartModel({
    this.name,
    this.make,
    this.model,
    this.condition,
    this.price,
    this.category,
    this.partId,
    this.status,
    this.balanceAmount,
    this.recievedAmount,
    this.soldPrice,
    this.totalPrice,
  });

  factory UpdatePartModel.fromJson(Map<String, dynamic> json) =>
      UpdatePartModel(
        name: json["name"],
        make: json["make"],
        model: json["model"],
        condition: json["condition"],
        price: json["price"],
        category: json["category"],
        partId: json["part_id"],
        status: json['status'],
        recievedAmount: json['recieved_amount'],
        soldPrice: json['sold_price'],
        balanceAmount: json['balance_amount'],
        totalPrice: json['total_price'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "make": make,
        "model": model,
        "condition": condition,
        "price": price,
        "part_id": partId,
        "category": category,
        'status': status,
        "recieved_amount": recievedAmount,
        "sold_price": soldPrice,
        "total_price": totalPrice,
        "balance_amount": balanceAmount,
      };
}
