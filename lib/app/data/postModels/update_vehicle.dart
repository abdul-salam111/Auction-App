// To parse this JSON data, do
//
//     final updateVehicleModel = updateVehicleModelFromJson(jsonString);

import 'dart:convert';

UpdateVehicleModel updateVehicleModelFromJson(String str) => UpdateVehicleModel.fromJson(json.decode(str));

String updateVehicleModelToJson(UpdateVehicleModel data) => json.encode(data.toJson());

class UpdateVehicleModel {
    String? chassisNumber;
    String? name;
    String? color;
    String? make;
    String? model;
    String? year;
    String? fuel;
    String? transmission;
    String? condition;
    String? price;
    String? mileage;
    String? description;

    UpdateVehicleModel({
        this.chassisNumber,
        this.name,
        this.color,
        this.make,
        this.model,
        this.year,
        this.fuel,
        this.transmission,
        this.condition,
        this.price,
        this.mileage,
        this.description,
    });

    UpdateVehicleModel copyWith({
        String? chassisNumber,
        String? name,
        String? color,
        String? make,
        String? model,
        String? year,
        String? fuel,
        String? transmission,
        String? condition,
        String? price,
        String? mileage,
        String? description,
    }) => 
        UpdateVehicleModel(
            chassisNumber: chassisNumber ?? this.chassisNumber,
            name: name ?? this.name,
            color: color ?? this.color,
            make: make ?? this.make,
            model: model ?? this.model,
            year: year ?? this.year,
            fuel: fuel ?? this.fuel,
            transmission: transmission ?? this.transmission,
            condition: condition ?? this.condition,
            price: price ?? this.price,
            mileage: mileage ?? this.mileage,
            description: description ?? this.description,
        );

    factory UpdateVehicleModel.fromJson(Map<String, dynamic> json) => UpdateVehicleModel(
        chassisNumber: json["chassis_number"],
        name: json["name"],
        color: json["color"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        fuel: json["fuel"],
        transmission: json["transmission"],
        condition: json["condition"],
        price: json["price"],
        mileage: json["mileage"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "chassis_number": chassisNumber,
        "name": name,
        "color": color,
        "make": make,
        "model": model,
        "year": year,
        "fuel": fuel,
        "transmission": transmission,
        "condition": condition,
        "price": price,
        "mileage": mileage,
        "description": description,
    };
}
