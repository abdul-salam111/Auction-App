import 'dart:convert';

LoginByUidModel loginByUidModelFromJson(String str) =>
    LoginByUidModel.fromJson(json.decode(str));

String loginByUidModelToJson(LoginByUidModel data) =>
    json.encode(data.toJson());

class LoginByUidModel {
  final String? uid;
  final String? password;

  LoginByUidModel({
    this.uid,
    this.password,
  });

  factory LoginByUidModel.fromJson(Map<String, dynamic> json) =>
      LoginByUidModel(
        uid: json["uid"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "password": password,
      };
}
