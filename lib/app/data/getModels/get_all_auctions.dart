// To parse this JSON data, do
//
//     final getAllAuctions = getAllAuctionsFromJson(jsonString);

import 'dart:convert';

GetAllAuctions getAllAuctionsFromJson(String str) =>
    GetAllAuctions.fromJson(json.decode(str));

String getAllAuctionsToJson(GetAllAuctions data) => json.encode(data.toJson());

class GetAllAuctions {
  final List<AuctionsData>? data;

  GetAllAuctions({
    this.data,
  });

  factory GetAllAuctions.fromJson(Map<String, dynamic> json) => GetAllAuctions(
        data: json["data"] == null
            ? []
            : List<AuctionsData>.from(json["data"]!.map((x) => AuctionsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AuctionsData {
  final DateTime? createdAt;
  final String? auctionLocation;
  final int? id;
  final String? auctionName;
  final DateTime? updatedAt;
  final bool? auctionStatus;
  final int? count;

  AuctionsData({
    this.createdAt,
    this.auctionLocation,
    this.id,
    this.auctionName,
    this.updatedAt,
    this.auctionStatus,
    this.count,
  });

  factory AuctionsData.fromJson(Map<String, dynamic> json) => AuctionsData(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        auctionLocation: json["auction_location"],
        id: json["id"],
        auctionName: json["auction_name"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        auctionStatus: json["auction_status"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "auction_location": auctionLocation,
        "id": id,
        "auction_name": auctionName,
        "updated_at": updatedAt?.toIso8601String(),
        "auction_status": auctionStatus,
        "count": count,
      };
}
