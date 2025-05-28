// To parse this JSON data, do
//
//     final updateStatus = updateStatusFromJson(jsonString);

import 'dart:convert';

UpdateStatus updateStatusFromJson(String str) =>
    UpdateStatus.fromJson(json.decode(str));

String updateStatusToJson(UpdateStatus data) => json.encode(data.toJson());

class UpdateStatus {
  UpdateStatus({
    required this.chassisNo,
    required this.partId,
    required this.balanceAmount,
    required this.recievedAmount,
    required this.soldPrice,
    required this.status,
  });

  final String? chassisNo;
  final dynamic partId;
  final double? balanceAmount;
  final double? recievedAmount;
  final double? soldPrice;
  final String? status;

  UpdateStatus copyWith({
    String? chassisNo,
    String? partId,
    double? balanceAmount,
    double? recievedAmount,
    double? soldPrice,
    String? status,
  }) {
    return UpdateStatus(
      chassisNo: chassisNo ?? this.chassisNo,
      partId: partId ?? this.partId,
      balanceAmount: balanceAmount ?? this.balanceAmount,
      recievedAmount: recievedAmount ?? this.recievedAmount,
      soldPrice: soldPrice ?? this.soldPrice,
      status: status ?? this.status,
    );
  }

  factory UpdateStatus.fromJson(Map<String, dynamic> json) {
    return UpdateStatus(
      chassisNo: json["chassis_no"],
      partId: json["part_id"],
      balanceAmount: json["balance_amount"],
      recievedAmount: json["recieved_amount"],
      soldPrice: json["sold_price"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "chassis_no": chassisNo,
        "part_id": partId,
        "balance_amount": balanceAmount,
        "recieved_amount": recievedAmount,
        "sold_price": soldPrice,
        "status": status,
      };
}
