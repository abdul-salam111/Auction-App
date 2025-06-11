// To parse this JSON data, do
//
//     final carDataModel = carDataModelFromJson(jsonString);

import 'dart:convert';

CarDataModel carDataModelFromJson(String str) =>
    CarDataModel.fromJson(json.decode(str));

String carDataModelToJson(CarDataModel data) => json.encode(data.toJson());

class CarDataModel {
  List<CarData>? data;

  CarDataModel({
    this.data,
  });

  factory CarDataModel.fromJson(Map<String, dynamic> json) => CarDataModel(
        data: json["data"] == null
            ? []
            : List<CarData>.from(json["data"]!.map((x) => CarData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CarData {
  int? id;
  String? bodyType;
  String? make;
  String? model;
  String? color;
  String? score;
  String? displacement;

  CarData({
    this.id,
    this.bodyType,
    this.make,
    this.model,
    this.color,
    this.score,
    this.displacement,
  });

  factory CarData.fromJson(Map<String, dynamic> json) => CarData(
        id: json["id"],
        bodyType: json["body_type"],
        make: json["make"],
        model: json["model"],
        color: json["color"],
        score: json["score"],
        displacement: json["displacement"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body_type": bodyType,
        "make": make,
        "model": model,
        "color": color,
        "score": score,
        "displacement": displacement,
      };
}
