// To parse this JSON data, do
//
//     final getBidsOfAnAuction = getBidsOfAnAuctionFromJson(jsonString);

import 'dart:convert';

GetBidsOfAnAuction getBidsOfAnAuctionFromJson(String str) =>
    GetBidsOfAnAuction.fromJson(json.decode(str));

String getBidsOfAnAuctionToJson(GetBidsOfAnAuction data) =>
    json.encode(data.toJson());

class GetBidsOfAnAuction {
  final List<Bid>? bids;

  GetBidsOfAnAuction({
    this.bids,
  });

  factory GetBidsOfAnAuction.fromJson(Map<String, dynamic> json) =>
      GetBidsOfAnAuction(
        bids: json["bids"] == null
            ? []
            : List<Bid>.from(json["bids"]!.map((x) => Bid.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bids": bids == null
            ? []
            : List<dynamic>.from(bids!.map((x) => x.toJson())),
      };
}

class Bid {
  final String? name;
  final String? phoneNumber;
  final int? itemId;
  final int? auctionId;
  final dynamic vehicle;
  final dynamic vehicleChassis;
  final String? sparepart;
  final int? sparepartId;
  final double? bidAmount;
  final DateTime? createdAt;

  Bid({
    this.name,
    this.phoneNumber,
    this.itemId,
    this.auctionId,
    this.vehicle,
    this.vehicleChassis,
    this.sparepart,
    this.sparepartId,
    this.bidAmount,
    this.createdAt,
  });

  factory Bid.fromJson(Map<String, dynamic> json) => Bid(
        name: json["name"],
        phoneNumber: json["phone_number"],
        itemId: json["item_id"],
        auctionId: json["auction_id"],
        vehicle: json["vehicle"],
        vehicleChassis: json["vehicle_chassis"],
        sparepart: json["sparepart"],
        sparepartId: json["sparepart_id"],
        bidAmount: json["bid_amount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "item_id": itemId,
        "auction_id": auctionId,
        "vehicle": vehicle,
        "vehicle_chassis": vehicleChassis,
        "sparepart": sparepart,
        "sparepart_id": sparepartId,
        "bid_amount": bidAmount,
        "created_at": createdAt?.toIso8601String(),
      };
}
