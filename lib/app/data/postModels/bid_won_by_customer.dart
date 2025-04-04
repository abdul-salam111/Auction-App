// To parse this JSON data, do
//
//     final bidWonByCustomer = bidWonByCustomerFromJson(jsonString);

import 'dart:convert';

BidWonByCustomer bidWonByCustomerFromJson(String str) => BidWonByCustomer.fromJson(json.decode(str));

String bidWonByCustomerToJson(BidWonByCustomer data) => json.encode(data.toJson());

class BidWonByCustomer {
    final String? contact;
    final String? chassis;
    final String? bidAmount;
    final String? partId;

    BidWonByCustomer({
        this.contact,
        this.chassis,
        this.bidAmount,
        this.partId,
    });

    factory BidWonByCustomer.fromJson(Map<String, dynamic> json) => BidWonByCustomer(
        contact: json["contact"],
        chassis: json["chassis"],
        bidAmount: json["bid_amount"],
        partId: json["part_id"],
    );

    Map<String, dynamic> toJson() => {
        "contact": contact,
        "chassis": chassis,
        "bid_amount": bidAmount,
        "part_id": partId,
    };
}
