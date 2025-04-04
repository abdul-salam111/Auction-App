// To parse this JSON data, do
//
//     final createNewAuction = createNewAuctionFromJson(jsonString);

import 'dart:convert';

CreateNewAuction createNewAuctionFromJson(String str) =>
    CreateNewAuction.fromJson(json.decode(str));

String createNewAuctionToJson(CreateNewAuction data) =>
    json.encode(data.toJson());

class CreateNewAuction {
  final String? auctionName;
  final String? auctionLocation;
  final String? auctionStatus;

  CreateNewAuction({
    this.auctionName,
    this.auctionLocation,
    this.auctionStatus,
  });

  factory CreateNewAuction.fromJson(Map<String, dynamic> json) =>
      CreateNewAuction(
        auctionName: json["auction_name"],
        auctionLocation: json["auction_location"],
        auctionStatus: json["auction_status"],
      );

  Map<String, dynamic> toJson() => {
        "auction_name": auctionName,
        "auction_location": auctionLocation,
        "auction_status": auctionStatus,
      };
}
