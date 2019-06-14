class BillModel {
  String uuid;
  String supplier;
  String associateBill;
  String purchaseMode;
  String acceptor;
  int quantity;

  BillModel.build({
    this.uuid,
    this.supplier,
    this.associateBill,
    this.purchaseMode,
    this.acceptor,
    this.quantity,
  });

  BillModel.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] ?? '',
        supplier = json['supplier'] ?? '',
        associateBill = json['associateBill'] ?? '',
        purchaseMode = json['purchaseMode'] ?? '',
        acceptor = json['acceptor'] ?? '',
        quantity = json['quantity'] ?? 0;
}
