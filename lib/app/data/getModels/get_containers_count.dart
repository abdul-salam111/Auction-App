// To parse this JSON data, do
//
//     final getContainersCount = getContainersCountFromJson(jsonString);

import 'dart:convert';

GetContainersCount getContainersCountFromJson(String str) =>
    GetContainersCount.fromJson(json.decode(str));

String getContainersCountToJson(GetContainersCount data) =>
    json.encode(data.toJson());

class GetContainersCount {
  final int? arrived;
  final int? upcoming;
  final int? total;

  GetContainersCount({
    this.arrived,
    this.upcoming,
    this.total,
  });

  factory GetContainersCount.fromJson(Map<String, dynamic> json) =>
      GetContainersCount(
        arrived: json["arrived"],
        upcoming: json["upcoming"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "arrived": arrived,
        "upcoming": upcoming,
        "total": total,
      };
}
