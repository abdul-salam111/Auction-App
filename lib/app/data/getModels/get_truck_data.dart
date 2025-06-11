// To parse this JSON data, do
//
//     final getTruckData = getTruckDataFromJson(jsonString);

import 'dart:convert';

GetTruckData getTruckDataFromJson(String str) => GetTruckData.fromJson(json.decode(str));

String getTruckDataToJson(GetTruckData data) => json.encode(data.toJson());

class GetTruckData {
  List<TruckData>? data;

  GetTruckData({
    this.data,
  });

  factory GetTruckData.fromJson(Map<String, dynamic> json) => GetTruckData(
        data: json["data"] == null
            ? []
            : List<TruckData>.from(json["data"].map((x) => TruckData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TruckData {
  int? id;
  String? bodyType;
  String? make;
  String? model;
  String? color;
  String? score;
  String? displacement;

  TruckData({
    this.id,
    this.bodyType,
    this.make,
    this.model,
    this.color,
    this.score,
    this.displacement,
  });

  factory TruckData.fromJson(Map<String, dynamic> json) => TruckData(
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
