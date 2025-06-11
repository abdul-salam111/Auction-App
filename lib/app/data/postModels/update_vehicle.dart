// To parse this JSON data, do
//
//     final updateVehicleModel = updateVehicleModelFromJson(jsonString);

import 'dart:convert';

UpdateVehicleModel updateVehicleModelFromJson(String str) =>
    UpdateVehicleModel.fromJson(json.decode(str));

String updateVehicleModelToJson(UpdateVehicleModel data) =>
    json.encode(data.toJson());

class UpdateVehicleModel {
  String? chassisNumber;
  String? name;
  String? color;
  String? make;
  String? model;
  String? year;
  String? fuel;
  String? transmission;
  String? condition;
  String? price;
  String? mileage;
  String? description;
  String? status;
  String? recievedAmount;
  String? balanceAmount;
  String? soldPrice;
  String? totalPrice;

  UpdateVehicleModel({
    this.chassisNumber,
    this.name,
    this.color,
    this.make,
    this.model,
    this.year,
    this.fuel,
    this.transmission,
    this.condition,
    this.price,
    this.mileage,
    this.description,
    this.status,
    this.balanceAmount,
    this.recievedAmount,
    this.soldPrice,
    this.totalPrice,
  });

  factory UpdateVehicleModel.fromJson(Map<String, dynamic> json) =>
      UpdateVehicleModel(
          chassisNumber: json["chassis_number"],
          name: json["name"],
          color: json["color"],
          make: json["make"],
          model: json["model"],
          year: json["year"],
          fuel: json["fuel"],
          transmission: json["transmission"],
          condition: json["condition"],
          price: json["price"],
          mileage: json["mileage"],
          description: json["description"],
          recievedAmount: json['recieved_amount'],
          soldPrice: json['sold_price'],
          balanceAmount: json['balance_amount'],
          totalPrice: json['total_price'],
          status: json['status']);

  Map<String, dynamic> toJson() => {
        "chassis_number": chassisNumber,
        "name": name,
        "color": color,
        "make": make,
        "model": model,
        "year": year,
        "fuel": fuel,
        "transmission": transmission,
        "condition": condition,
        "price": price,
        "mileage": mileage,
        "description": description,
        "status": status,
        "recieved_amount": recievedAmount,
        "sold_price": soldPrice,
        "total_price": totalPrice,
        "balance_amount": balanceAmount,
      };
}
