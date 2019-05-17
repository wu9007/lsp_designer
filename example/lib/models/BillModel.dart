class BillModel {
  String uuid;
  String billCode;
  String warehouse;
  String supplier;
  String billType;
  String associateBill;
  String purchaseMode;
  String payMode;
  String acceptor;
  String salesCode;

  BillModel.build(
      {this.uuid,
      this.billCode,
      this.warehouse,
      this.supplier,
      this.billType,
      this.associateBill,
      this.purchaseMode,
      this.payMode,
      this.acceptor,
      this.salesCode});

  BillModel.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] ?? '',
        billCode = json['billCode'] ?? '',
        warehouse = json['warehouse'] ?? '',
        supplier = json['supplier'] ?? '',
        billType = json['billType'] ?? '',
        associateBill = json['associateBill'] ?? '',
        purchaseMode = json['purchaseMode'] ?? '',
        payMode = json['payMode'] ?? '',
        acceptor = json['acceptor'] ?? '',
        salesCode = json['salesCode'] ?? '';

  bool available() {
    return this.warehouse != null &&
        this.warehouse.isNotEmpty &&
        this.supplier != null &&
        this.supplier.isNotEmpty &&
        this.billType != null &&
        this.billType.isNotEmpty &&
        this.associateBill != null &&
        this.associateBill.isNotEmpty &&
        this.purchaseMode != null &&
        this.purchaseMode.isNotEmpty &&
        this.payMode != null &&
        this.payMode.isNotEmpty &&
        this.acceptor != null &&
        this.acceptor.isNotEmpty &&
        this.salesCode != null &&
        this.salesCode.isNotEmpty;
  }
}
