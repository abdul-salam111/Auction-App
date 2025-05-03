class CustomerPart {
  String? id;
  String? name;
  String? bidAmount;
  String? model;

  CustomerPart({this.id, this.name, this.bidAmount, this.model});

  factory CustomerPart.fromJson(Map<String, dynamic> json) => CustomerPart(
        id: json["id"],
        name: json["name"],
        bidAmount: json["bid_amount"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bid_amount": bidAmount,
        "model": model,
      };
}

class CustomerVehicle {
  String? chassisNumber;
  String? name;
  String? bidAmount;
  String? model;
  String? make;

  CustomerVehicle({
    this.chassisNumber,
    this.name,
    this.bidAmount,
    this.make,
    this.model,
  });

  factory CustomerVehicle.fromJson(Map<String, dynamic> json) =>
      CustomerVehicle(
        chassisNumber: json["chassis_number"],
        name: json["name"],
        bidAmount: json["bid_amount"],
        make: json["make"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "chassis_number": chassisNumber,
        "name": name,
        "bid_amount": bidAmount,
        "make": make,
        "model": model,
      };
}
