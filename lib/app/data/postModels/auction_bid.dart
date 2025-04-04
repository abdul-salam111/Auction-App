// To parse this JSON data, do
//
//     final addNewBid = addNewBidFromJson(jsonString);

import 'dart:convert';

AddNewBid addNewBidFromJson(String str) => AddNewBid.fromJson(json.decode(str));

String addNewBidToJson(AddNewBid data) => json.encode(data.toJson());

class AddNewBid {
  String? name;
  String? contact;
  String? auctionId;
  List<Vehicle>? vehicles;
  List<Part>? parts;

  AddNewBid({
    this.name,
    this.contact,
    this.auctionId,
    this.vehicles,
    this.parts,
  });

  factory AddNewBid.fromJson(Map<String, dynamic> json) => AddNewBid(
        name: json["name"],
        contact: json["contact"],
        auctionId: json["auction_id"],
        vehicles: json["vehicles"] == null
            ? []
            : List<Vehicle>.from(
                json["vehicles"]!.map((x) => Vehicle.fromJson(x))),
        parts: json["parts"] == null
            ? []
            : List<Part>.from(json["parts"]!.map((x) => Part.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "contact": contact,
        "auction_id": auctionId,
        "vehicles": vehicles == null
            ? []
            : List<dynamic>.from(vehicles!.map((x) => x.toJson())),
        "parts": parts == null
            ? []
            : List<dynamic>.from(parts!.map((x) => x.toJson())),
      };
}

class Part {
  String? id;
  String? name;
  String? bidAmount;

  Part({
    this.id,
    this.name,
    this.bidAmount,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        id: json["id"],
        name: json["name"],
        bidAmount: json["bid_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bid_amount": bidAmount,
      };
}

class Vehicle {
  String? chassisNumber;
  String? name;
  String? bidAmount;

  Vehicle({
    this.chassisNumber,
    this.name,
    this.bidAmount,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        chassisNumber: json["chassis_number"],
        name: json["name"],
        bidAmount: json["bid_amount"],
      );

  Map<String, dynamic> toJson() => {
        "chassis_number": chassisNumber,
        "name": name,
        "bid_amount": bidAmount,
      };
}
