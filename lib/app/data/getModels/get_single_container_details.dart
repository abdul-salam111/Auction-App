// To parse this JSON data, do
//
//     final fetchSingleContainerDetails = fetchSingleContainerDetailsFromJson(jsonString);

import 'dart:convert';

FetchSingleContainerDetails fetchSingleContainerDetailsFromJson(String str) =>
    FetchSingleContainerDetails.fromJson(json.decode(str));

String fetchSingleContainerDetailsToJson(FetchSingleContainerDetails data) =>
    json.encode(data.toJson());

class FetchSingleContainerDetails {
  final List<ContainerData>? data;

  FetchSingleContainerDetails({
    this.data,
  });

  factory FetchSingleContainerDetails.fromJson(Map<String, dynamic> json) =>
      FetchSingleContainerDetails(
        data: json["data"] == null
            ? []
            : List<ContainerData>.from(
                json["data"]!.map((x) => ContainerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ContainerData {
  final ContainerDetails? container;
  final List<dynamic>? images;
  final List<Item>? items;

  ContainerData({
    this.container,
    this.images,
    this.items,
  });

  factory ContainerData.fromJson(Map<String, dynamic> json) => ContainerData(
        container: json["container"] == null
            ? null
            : ContainerDetails.fromJson(json["container"]),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "container": container?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ContainerDetails {
  final int? id;
  final String? shippingCompany;
  final DateTime? createdAt;
  final String? containerNumber;
  final String? grossWeight;
  final String? portOfLoading;
  final String? status;
  final DateTime? updatedAt;
  final String? shipper;
  final String? blNumber;
  final String? sealNumber;
  final String? portOfDischarge;
  final String? noOfUnits;
  final dynamic description;

  ContainerDetails({
    this.id,
    this.shippingCompany,
    this.createdAt,
    this.containerNumber,
    this.grossWeight,
    this.portOfLoading,
    this.status,
    this.updatedAt,
    this.shipper,
    this.blNumber,
    this.sealNumber,
    this.portOfDischarge,
    this.noOfUnits,
    this.description,
  });

  factory ContainerDetails.fromJson(Map<String, dynamic> json) =>
      ContainerDetails(
        id: json["id"],
        shippingCompany: json["shipping_company"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        containerNumber: json["container_number"],
        grossWeight: json["gross_weight"],
        portOfLoading: json["port_of_loading"],
        status: json["status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        shipper: json["shipper"],
        blNumber: json["bl_number"],
        sealNumber: json["seal_number"],
        portOfDischarge: json["port_of_discharge"],
        noOfUnits: json["no_of_units"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shipping_company": shippingCompany,
        "created_at": createdAt?.toIso8601String(),
        "container_number": containerNumber,
        "gross_weight": grossWeight,
        "port_of_loading": portOfLoading,
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "shipper": shipper,
        "bl_number": blNumber,
        "seal_number": sealNumber,
        "port_of_discharge": portOfDischarge,
        "no_of_units": noOfUnits,
        "description": description,
      };
}

class Item {
  final String? type;
  final int? id;
  final String? chassisNumber;
  final String? make;
  final String? model;
  final String? year;
  final String? color;
  final double? price;

  Item({
    this.type,
    this.id,
    this.chassisNumber,
    this.make,
    this.model,
    this.year,
    this.color,
    this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        type: json["type"],
        id: json["id"],
        chassisNumber: json["chassis_number"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        color: json["color"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "chassis_number": chassisNumber,
        "make": make,
        "model": model,
        "year": year,
        "color": color,
        "price": price,
      };
}
