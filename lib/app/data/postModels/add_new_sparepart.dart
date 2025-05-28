class AddNewPart {
  String? partId;
  String? name;
  String? make;
  String? model;
  String? conditionReport;
  String? category;
  double? price;
  String? description;
  String? status;
  bool? isClear;
  String? reportStatus;
  double? soldPrice;
  double? recievedAmount;
  double? balanceAmount;
  String? feature;
  String? supplier;
  int? fkContainerId;
  int? fkVehicleId;

  AddNewPart({
    this.partId,
    this.name,
    this.make,
    this.model,
    this.conditionReport,
    this.category,
    this.price,
    this.description,
    this.status,
    this.isClear,
    this.reportStatus,
    this.soldPrice,
    this.recievedAmount,
    this.balanceAmount,
    this.feature,
    this.supplier,
    this.fkContainerId,
    this.fkVehicleId,
  });

  factory AddNewPart.fromJson(Map<String, dynamic> json) {
    return AddNewPart(
      partId: json['part_id'],
      name: json['name'],
      make: json['make'],
      model: json['model'],
      conditionReport: json['condition_report'],
      category: json['category'],
      price: json['price'],
      description: json['description'],
      status: json['status'],
      isClear: json['is_clear'],
      reportStatus: json['report_status'],
      soldPrice: json['sold_price'],
      recievedAmount: json['recieved_amount'],
      balanceAmount: json['balance_amount'],
      feature: json['feature'],
      supplier: json['supplier'],
      fkContainerId: json['fk_container_id'],
      fkVehicleId: json['fk_vehicle_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'part_id': partId,
      'name': name,
      'make': make,
      'model': model,
      'condition_report': conditionReport,
      'category': category,
      'price': price,
      'description': description,
      'status': status,
      'is_clear': isClear,
      'report_status': reportStatus,
      'sold_price': soldPrice,
      'recieved_amount': recievedAmount,
      'balance_amount': balanceAmount,
      'feature': feature,
      'supplier': supplier,
      'fk_container_id': fkContainerId,
      'fk_vehicle_id': fkVehicleId,
    };
  }
}
