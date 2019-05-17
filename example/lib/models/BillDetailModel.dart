class BillDetailModel {
  String uuid;
  String materialName;
  String statisticalUnit;
  String unit;
  String specification;
  String expireDate;
  String price;
  String pendingStorage;
  String alreadyStorage;

  BillDetailModel.build(
      {this.uuid,
      this.materialName,
      this.statisticalUnit,
      this.unit,
      this.specification,
      this.expireDate,
      this.price,
      this.pendingStorage,
      this.alreadyStorage});

  BillDetailModel.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] ?? '',
        materialName = json['materialName'] ?? '',
        statisticalUnit = json['statisticalUnit'] ?? '',
        unit = json['unit'] ?? '',
        specification = json['specification'] ?? '',
        expireDate = json['expireDate'] ?? '',
        price = json['price'] ?? '',
        pendingStorage = json['pendingStorage'] ?? '',
        alreadyStorage = json['alreadyStorage'] ?? '';
}
