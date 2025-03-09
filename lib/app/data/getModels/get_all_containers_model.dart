import 'dart:convert';

GetAllContainersModel getAllContainersModelFromJson(String str) =>
    GetAllContainersModel.fromJson(json.decode(str));

String getAllContainersModelToJson(GetAllContainersModel data) =>
    json.encode(data.toJson());

class GetAllContainersModel {
  final List<ContainersData>? data;

  GetAllContainersModel({
    this.data,
  });

  factory GetAllContainersModel.fromJson(Map<String, dynamic> json) =>
      GetAllContainersModel(
        data: json["data"] == null
            ? []
            : List<ContainersData>.from(
                json["data"].map((x) => ContainersData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ContainersData {
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

  ContainersData({
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

  factory ContainersData.fromJson(Map<String, dynamic> json) => ContainersData(
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
