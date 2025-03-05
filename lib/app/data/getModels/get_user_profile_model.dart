// To parse this JSON data, do
//
//     final getUserProfileInfo = getUserProfileInfoFromJson(jsonString);

import 'dart:convert';

GetUserProfileInfo getUserProfileInfoFromJson(String str) =>
    GetUserProfileInfo.fromJson(json.decode(str));

String getUserProfileInfoToJson(GetUserProfileInfo data) =>
    json.encode(data.toJson());

class GetUserProfileInfo {
  final DateTime? updatedAt;
  final int? fkUserId;
  final String? lastname;
  final String? idNumber;
  final String? firstname;
  final DateTime? createdAt;
  final int? id;
  final String? mobilenumber;
  final String? email;

  GetUserProfileInfo({
    this.updatedAt,
    this.fkUserId,
    this.lastname,
    this.idNumber,
    this.firstname,
    this.createdAt,
    this.id,
    this.mobilenumber,
    this.email,
  });

  factory GetUserProfileInfo.fromJson(Map<String, dynamic> json) =>
      GetUserProfileInfo(
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fkUserId: json["fk_user_id"] ?? "",
        lastname: json["lastname"] ?? "",
        idNumber: json["ID_number"] ?? "",
        firstname: json["firstname"] ?? "",
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] ?? "",
        mobilenumber: json["mobilenumber"] ?? "",
        email: json["email"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "updated_at": updatedAt?.toIso8601String(),
        "fk_user_id": fkUserId,
        "lastname": lastname,
        "ID_number": idNumber,
        "firstname": firstname,
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "mobilenumber": mobilenumber,
        "email": email,
      };
}
