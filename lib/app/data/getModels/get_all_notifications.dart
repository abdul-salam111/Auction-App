// To parse this JSON data, do
//
//     final getAllNotifications = getAllNotificationsFromJson(jsonString);

import 'dart:convert';

List<GetAllNotifications> getAllNotificationsFromJson(String str) =>
    List<GetAllNotifications>.from(
        json.decode(str).map((x) => GetAllNotifications.fromJson(x)));

String getAllNotificationsToJson(List<GetAllNotifications> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllNotifications {
  final int? id;
  final int? fkUserId;
  final String? message;
  final bool? read;
  final String? createdAt;
  final String? updatedAt;

  GetAllNotifications({
    this.id,
    this.fkUserId,
    this.message,
    this.read,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAllNotifications.fromJson(Map<String, dynamic> json) =>
      GetAllNotifications(
        id: json["id"],
        fkUserId: json["fk_user_id"],
        message: json["message"],
        read: json["read"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fk_user_id": fkUserId,
        "message": message,
        "read": read,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
