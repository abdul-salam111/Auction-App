// To parse this JSON data, do
//
//     final addNewContainer = addNewContainerFromJson(jsonString);

import 'dart:convert';

AddNewContainer addNewContainerFromJson(String str) =>
    AddNewContainer.fromJson(json.decode(str));

String addNewContainerToJson(AddNewContainer data) =>
    json.encode(data.toJson());

class AddNewContainer {
  String? shipper;
  String? shippingCompany;
  String? blNumber;
  String? containerNumber;
  String? sealNumber;
  String? grossWeight;
  String? portOfLoading;
  String? portOfDischarge;
  String? noOfUnits;
  String? status;
  String? description;
  List<Vehicle>? vehicles;
  List<Part>? parts;
  List<String>? images;

  AddNewContainer({
    this.shipper,
    this.shippingCompany,
    this.blNumber,
    this.containerNumber,
    this.sealNumber,
    this.grossWeight,
    this.portOfLoading,
    this.portOfDischarge,
    this.noOfUnits,
    this.status,
    this.description,
    this.vehicles,
    this.parts,
    this.images,
  });

  factory AddNewContainer.fromJson(Map<String, dynamic> json) =>
      AddNewContainer(
        shipper: json["shipper"],
        shippingCompany: json["shipping_company"],
        blNumber: json["bl_number"],
        containerNumber: json["container_number"],
        sealNumber: json["seal_number"],
        grossWeight: json["gross_weight"],
        portOfLoading: json["port_of_loading"],
        portOfDischarge: json["port_of_discharge"],
        noOfUnits: json["no_of_units"],
        status: json["status"],
        description: json["description"],
        vehicles: json["vehicles"] == null
            ? []
            : List<Vehicle>.from(
                json["vehicles"].map((x) => Vehicle.fromJson(x))),
        parts: json["parts"] == null
            ? []
            : List<Part>.from(json["parts"].map((x) => Part.fromJson(x))),
        images: json["images"] == null ? [] : List<String>.from(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "shipper": shipper,
        "shipping_company": shippingCompany,
        "bl_number": blNumber,
        "container_number": containerNumber,
        "seal_number": sealNumber,
        "gross_weight": grossWeight,
        "port_of_loading": portOfLoading,
        "port_of_discharge": portOfDischarge,
        "no_of_units": noOfUnits,
        "status": status,
        "description": description,
        "vehicles": vehicles == null
            ? []
            : List<dynamic>.from(vehicles!.map((x) => x.toJson())),
        "parts": parts == null
            ? []
            : List<dynamic>.from(parts!.map((x) => x.toJson())),
        "images": images == null ? [] : List<dynamic>.from(images!),
      };
}

class Vehicle {
  String? chassisNumber;
  String? make;
  String? model;
  String? year;
  String? color;

  Vehicle({
    this.chassisNumber,
    this.make,
    this.model,
    this.year,
    this.color,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        chassisNumber: json["chassis_number"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "chassis_number": chassisNumber,
        "make": make,
        "model": model,
        "year": year,
        "color": color,
      };
}

class Part {
  String? id;
  String? name;
  String? make;
  String? model;

  Part({
    this.id,
    this.name,
    this.make,
    this.model,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        id: json["id"],
        name: json["name"],
        make: json["make"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "make": make,
        "model": model,
      };
}
