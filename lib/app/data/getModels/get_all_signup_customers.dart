import 'dart:convert';

GetAllSignupCustomersModel getAllSignupCustomersModelFromJson(String str) =>
    GetAllSignupCustomersModel.fromJson(json.decode(str));

String getAllSignupCustomersModelToJson(GetAllSignupCustomersModel data) =>
    json.encode(data.toJson());

class GetAllSignupCustomersModel {
  final List<UserData>? data;

  GetAllSignupCustomersModel({
    this.data,
  });

  factory GetAllSignupCustomersModel.fromJson(Map<String, dynamic> json) =>
      GetAllSignupCustomersModel(
        data: json["data"] == null
            ? []
            : List<UserData>.from(
                json["data"].map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserData {
  final int? id;
  final String? firstname;
  final String? lastname;
  final dynamic email;
  final String? uid;
  final String? phonenumber;
  final String? role;
  final bool? status;
  final String? side;
  final String? termsAgreement;
  final String? mfaEnabled;
  final String? mfaSecret;
  final DateTime? createdOn;
  final String? emiratesId;
  final String? address;

  UserData({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.uid,
    this.phonenumber,
    this.role,
    this.status,
    this.side,
    this.termsAgreement,
    this.mfaEnabled,
    this.mfaSecret,
    this.createdOn,
    this.emiratesId,
    this.address,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        uid: json["uid"],
        phonenumber: json["phonenumber"],
        role: json["role"],
        status: json["status"],
        side: json["side"],
        termsAgreement: json["terms_agreement"],
        mfaEnabled: json["mfa_enabled"],
        mfaSecret: json["mfa_secret"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        emiratesId: json["emirates_id"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "uid": uid,
        "phonenumber": phonenumber,
        "role": role,
        "status": status,
        "side": side,
        "terms_agreement": termsAgreement,
        "mfa_enabled": mfaEnabled,
        "mfa_secret": mfaSecret,
        "created_on": createdOn?.toIso8601String(),
        "emirates_id": emiratesId,
        "address": address,
      };
}
