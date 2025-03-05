// To parse this JSON data, do
//
//     final getIndividualCustomerWonBids = getIndividualCustomerWonBidsFromJson(jsonString);

import 'dart:convert';

GetIndividualCustomerWonBids getIndividualCustomerWonBidsFromJson(String str) =>
    GetIndividualCustomerWonBids.fromJson(json.decode(str));

String getIndividualCustomerWonBidsToJson(GetIndividualCustomerWonBids data) =>
    json.encode(data.toJson());

class GetIndividualCustomerWonBids {
  final int? userId;
  final List<BidsWon>? bidsWon;

  GetIndividualCustomerWonBids({
    this.userId,
    this.bidsWon,
  });

  factory GetIndividualCustomerWonBids.fromJson(Map<String, dynamic> json) =>
      GetIndividualCustomerWonBids(
        userId: json["user_id"],
        bidsWon: json["bids_won"] == null
            ? []
            : List<BidsWon>.from(
                json["bids_won"]!.map((x) => BidsWon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "bids_won": bidsWon == null
            ? []
            : List<dynamic>.from(bidsWon!.map((x) => x.toJson())),
      };
}

class BidsWon {
  final int? bidId;
  final double? bidAmount;
  final DateTime? date;
  final int? productId;
  final int? vehicleId;
  final String? chassisNo;
  final String? vehicleName;
  final double? soldPrice;
  final double? recievedAmount;
  final double? balanceAmount;

  BidsWon({
    this.bidId,
    this.bidAmount,
    this.date,
    this.productId,
    this.vehicleId,
    this.chassisNo,
    this.vehicleName,
    this.soldPrice,
    this.recievedAmount,
    this.balanceAmount,
  });

  factory BidsWon.fromJson(Map<String, dynamic> json) => BidsWon(
        bidId: json["bid_id"],
        bidAmount: json["bid_amount"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        productId: json["product_id"],
        vehicleId: json["vehicle_id"],
        chassisNo: json["chassis_no"],
        vehicleName: json["vehicle_name"],
        soldPrice: json["sold_price"],
        recievedAmount: json["recieved_amount"],
        balanceAmount: json["balance_amount"],
      );

  Map<String, dynamic> toJson() => {
        "bid_id": bidId,
        "bid_amount": bidAmount,
        "date": date?.toIso8601String(),
        "product_id": productId,
        "vehicle_id": vehicleId,
        "chassis_no": chassisNo,
        "vehicle_name": vehicleName,
        "sold_price": soldPrice,
        "recieved_amount": recievedAmount,
        "balance_amount": balanceAmount,
      };
}
