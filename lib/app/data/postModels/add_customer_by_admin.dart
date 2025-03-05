// To parse this JSON data, do
//
//     final addCustomerByAdmin = addCustomerByAdminFromJson(jsonString);

import 'dart:convert';

AddCustomerByAdminModel addCustomerByAdminFromJson(String str) =>
    AddCustomerByAdminModel.fromJson(json.decode(str));

String addCustomerByAdminToJson(AddCustomerByAdminModel data) =>
    json.encode(data.toJson());

class AddCustomerByAdminModel {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phonenumber;
  final String? role;
  final String? status;
  final String? emiratesId;
  final String? address;

  AddCustomerByAdminModel({
    this.firstname,
    this.lastname,
    this.email,
    this.phonenumber,
    this.role,
    this.status,
    this.emiratesId,
    this.address,
  });

  factory AddCustomerByAdminModel.fromJson(Map<String, dynamic> json) =>
      AddCustomerByAdminModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        role: json["role"],
        status: json["status"],
        emiratesId: json["emirates_id"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phonenumber": phonenumber,
        "role": role,
        "status": status,
        "emirates_id": emiratesId,
        "address": address,
      };
}
