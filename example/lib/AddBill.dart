import 'package:flutter/material.dart';
import 'package:lsp_designer_example/BillModel.dart';
import 'package:lsp_designer/SingleElection.dart';
import 'package:lsp_designer/Selector.dart';
import 'package:lsp_designer/VagueSelector.dart';

class AddBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AddBillState();
}

class AddBillState extends State<AddBill> {
  BillModel bill = BillModel.build();
  TextEditingController salesCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LSP_DESIGNER'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '中心库房：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: SingleElection<String>.build(
                    value: this.bill.warehouse,
                    color: Colors.teal,
                    list: this._warehouseList,
                    onPressed: (item) =>
                        this.setState(() => this.bill.warehouse = item.value),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '开单类型：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: SingleElection<String>.build(
                    value: this.bill.billType,
                    color: Colors.orange,
                    list: this._billTypeList,
                    onPressed: (item) =>
                        this.setState(() => this.bill.billType = item.value),
                  ),
                ),
              ],
            ),
          ),
          Selector(
            value: this.bill.supplier,
            label: Text(
              '供  应  商：',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            hint: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('请选择供应商'),
            ),
            store: this._supplierStore(),
            onChange: (item) => this.setState(() => this.bill.supplier = item),
          ),
          VagueSelector.build(
            value: this.bill.associateBill,
            label: Text(
              '关联单据：',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            list: List<SelectorItem>.generate(15, (index) {
              return SelectorItem(
                  display: 'AB-190517' + index.toString(),
                  value: '190517' + index.toString(),
                  content: '单据：AB-190517' + index.toString());
            }),
            onPressed: (value) {
              this.setState(() => this.bill.associateBill = value);
            },
            placeholder: '请选择关联单据',
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '采购方式：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: SingleElection<String>.build(
                    value: this.bill.purchaseMode,
                    color: Colors.deepOrange,
                    list: this._purchaseModeList,
                    onPressed: (item) => this
                        .setState(() => this.bill.purchaseMode = item.value),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '付款方式：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: SingleElection<String>.build(
                    value: this.bill.payMode,
                    list: this._payModeList,
                    onPressed: (item) =>
                        this.setState(() => this.bill.payMode = item.value),
                  ),
                ),
              ],
            ),
          ),
          Selector(
            value: this.bill.acceptor,
            label: Text(
              '验  收  人：',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            hint: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('请选择验收人'),
            ),
            store: this._acceptorStore(),
            onChange: (item) => this.setState(() => this.bill.acceptor = item),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '销货单号：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Expanded(
                  child: Container(
                    height: 52,
                    child: TextField(
                      controller: this.salesCodeController,
                      autofocus: false,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 10, bottom: 3, top: 18)),
                      onChanged: (value) =>
                          this.setState(() => this.bill.salesCode = value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 12,
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 30.0,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.hot_tub, color: Colors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.add_a_photo, color: Colors.white),
                onPressed: () {})
          ],
        ),
      ),
      floatingActionButton: SaveButton(this.bill.available(),
          successCallback: () => this.setState(() {
                this.bill = BillModel.build();
                this.salesCodeController.clear();
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  List<SingleElectionItem<String>> _payModeList = List.generate(
      2,
      (index) =>
          SingleElectionItem('付款方式' + index.toString(), index.toString()));

  List<SingleElectionItem<String>> _purchaseModeList = List.generate(
      5,
      (index) =>
          SingleElectionItem('采购方式' + index.toString(), index.toString()));

  List<SingleElectionItem<String>> _billTypeList = List.generate(
      2,
      (index) =>
          SingleElectionItem('开单类型' + index.toString(), index.toString()));

  List<SingleElectionItem<String>> _warehouseList = List.generate(
      3,
      (index) =>
          SingleElectionItem('中心库房' + index.toString(), index.toString()));

  _supplierStore() {
    return List.generate(
        5,
        (index) => DropdownMenuItem(
              value: '001' + index.toString(),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('测试供应商' + index.toString()),
              ),
            ));
  }

  _acceptorStore() {
    return List.generate(
        10,
        (index) => DropdownMenuItem(
              value: '001' + index.toString(),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('验收人' + index.toString()),
              ),
            ));
  }
}

class SaveButton extends StatelessWidget {
  SaveButton(this.available, {this.successCallback, this.failCallback});

  final bool available;
  final Function successCallback;
  final Function failCallback;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        if (available) {
          if (this.successCallback != null) this.successCallback();
          this._showSnackBar(context, '保存成功', true);
        } else {
          if (this.failCallback != null) this.failCallback();
          this._showSnackBar(context, '存在未填写项', false);
        }
      },
      foregroundColor: Colors.white,
      backgroundColor: available ? Colors.cyan : Colors.grey,
      icon: Icon(
        Icons.send,
      ),
      label: Text(' 提  交'),
    );
  }

  _showSnackBar(context, content, successful) {
    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_active, color: Colors.black),
          ),
          Text(
            content,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
      backgroundColor: successful ? Colors.green : Colors.yellowAccent,
      action: SnackBarAction(
          label: '关 闭', textColor: Colors.black54, onPressed: () {}),
      duration: Duration(seconds: 3),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
