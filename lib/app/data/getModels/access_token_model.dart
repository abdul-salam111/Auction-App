// To parse this JSON data, do
//
//     final accessTokenModel = accessTokenModelFromJson(jsonString);

import 'dart:convert';

AccessTokenModel accessTokenModelFromJson(String str) =>
    AccessTokenModel.fromJson(json.decode(str));

String accessTokenModelToJson(AccessTokenModel data) =>
    json.encode(data.toJson());

class AccessTokenModel {
  final String? accessToken;
  final String? tokenType;
  final String? refreshToken;

  AccessTokenModel({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      AccessTokenModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
      };
}
