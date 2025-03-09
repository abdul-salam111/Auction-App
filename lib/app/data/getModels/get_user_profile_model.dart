// To parse this JSON data, do
//
//     final getUserProfileInfo = getUserProfileInfoFromJson(jsonString);

import 'dart:convert';

GetUserProfileInfo getUserProfileInfoFromJson(String str) =>
    GetUserProfileInfo.fromJson(json.decode(str));

String getUserProfileInfoToJson(GetUserProfileInfo data) =>
    json.encode(data.toJson());

class GetUserProfileInfo {
  final Profile? profile;

  GetUserProfileInfo({
    this.profile,
  });

  factory GetUserProfileInfo.fromJson(Map<String, dynamic> json) =>
      GetUserProfileInfo(
        profile: json["data"] == null ? null : Profile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": profile?.toJson(),
      };
}

class Profile {
  final int? id;
  final String? lastname;
  final DateTime? createdAt;
  final String? uid;
  final String? originalPassword;
  final String? role;
  final String? side;
  final String? mfaEnabled;
  final String? emiratesId;
  final DateTime? updatedAt;
  final String? firstname;
  final String? email;
  final String? phonenumber;
  final String? password;
  final bool? status;
  final String? termsAgreement;
  final String? mfaSecret;
  final String? address;

  Profile({
    this.id,
    this.lastname,
    this.createdAt,
    this.uid,
    this.originalPassword,
    this.role,
    this.side,
    this.mfaEnabled,
    this.emiratesId,
    this.updatedAt,
    this.firstname,
    this.email,
    this.phonenumber,
    this.password,
    this.status,
    this.termsAgreement,
    this.mfaSecret,
    this.address,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        lastname: json["lastname"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        uid: json["uid"],
        originalPassword: json["original_password"],
        role: json["role"],
        side: json["side"],
        mfaEnabled: json["mfa_enabled"],
        emiratesId: json["emirates_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        firstname: json["firstname"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        password: json["password"],
        status: json["status"],
        termsAgreement: json["terms_agreement"],
        mfaSecret: json["mfa_secret"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lastname": lastname,
        "created_at": createdAt?.toIso8601String(),
        "uid": uid,
        "original_password": originalPassword,
        "role": role,
        "side": side,
        "mfa_enabled": mfaEnabled,
        "emirates_id": emiratesId,
        "updated_at": updatedAt?.toIso8601String(),
        "firstname": firstname,
        "email": email,
        "phonenumber": phonenumber,
        "password": password,
        "status": status,
        "terms_agreement": termsAgreement,
        "mfa_secret": mfaSecret,
        "address": address,
      };
}
