import 'dart:convert';

GetSparePartsData getSparePartsDataFromJson(String str) =>
    GetSparePartsData.fromJson(json.decode(str));

String getSparePartsDataToJson(GetSparePartsData data) =>
    json.encode(data.toJson());

class GetSparePartsData {
  List<PartsData>? data;

  GetSparePartsData({
    this.data,
  });

  factory GetSparePartsData.fromJson(Map<String, dynamic> json) =>
      GetSparePartsData(
        data: json["data"] == null
            ? []
            : List<PartsData>.from(json["data"]!.map((x) => PartsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PartsData {
  int? id;
  String? name;
  String? make;
  String? model;
  String? category;
  String? condition;
  String? status;

  PartsData({
    this.id,
    this.name,
    this.make,
    this.model,
    this.category,
    this.condition,
    this.status,
  });

  factory PartsData.fromJson(Map<String, dynamic> json) => PartsData(
        id: json["id"],
        name: json["name"],
        make: json["make"],
        model: json["model"],
        category: json["category"],
        condition: json["condition"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "make": make,
        "model": model,
        "category": category,
        "condition": condition,
        "status": status,
      };
}
