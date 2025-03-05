// To parse this JSON data, do
//
//     final updateCustomerByAdmin = updateCustomerByAdminFromJson(jsonString);

import 'dart:convert';

UpdateCustomerByAdmin updateCustomerByAdminFromJson(String str) =>
    UpdateCustomerByAdmin.fromJson(json.decode(str));

String updateCustomerByAdminToJson(UpdateCustomerByAdmin data) =>
    json.encode(data.toJson());

class UpdateCustomerByAdmin {
  final String? firstname;
  final String? lastname;
  final String? mobilenumber;
  final String? email;
  final String? status;
  final String? emiratesId;
  final String? address;
  final String? mfaEnabled;

  UpdateCustomerByAdmin({
    this.firstname,
    this.lastname,
    this.mobilenumber,
    this.email,
    this.status,
    this.emiratesId,
    this.address,
    this.mfaEnabled,
  });

  factory UpdateCustomerByAdmin.fromJson(Map<String, dynamic> json) =>
      UpdateCustomerByAdmin(
        firstname: json["firstname"],
        lastname: json["lastname"],
        mobilenumber: json["mobilenumber"],
        email: json["email"],
        status: json["status"],
        emiratesId: json["emirates_id"],
        address: json["address"],
        mfaEnabled: json["mfa_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "mobilenumber": mobilenumber,
        "email": email,
        "status": status,
        "emirates_id": emiratesId,
        "address": address,
        "mfa_enabled": mfaEnabled,
      };
}
