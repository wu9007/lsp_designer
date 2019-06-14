# lsp_designer_example

## Usage example

```dart
import 'package:flutter/material.dart';
import 'package:lsp_designer_example/BillModel.dart';
import 'package:lsp_designer/form/SingleElection.dart';
import 'package:lsp_designer/form/Selector.dart';
import 'package:lsp_designer/form/VagueSelector.dart';
import 'package:lsp_designer/form/NumberField.dart';

class AddBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AddBillState();
}

class AddBillState extends State<AddBill> {
  BillModel bill = BillModel.build();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('LSP_DESIGNER'),
      ),
      body: ListView(
        children: <Widget>[
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
              return SelectorItem(display: 'AB-190517' + index.toString(), value: '190517' + index.toString(), content: '单据：AB-190517' + index.toString());
            }),
            onPressed: (value) {
              if (value != null) this.setState(() => this.bill.associateBill = value);
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
                  child: SingleElection.build(
                    value: this.bill.purchaseMode,
                    color: Colors.deepOrange,
                    list: this._purchaseModeList,
                    onPressed: (item) => this.setState(() => this.bill.purchaseMode = item.value),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  '数        量：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                child: NumberField.build(
                  initValue: 0,
                  miniValue: 0,
                  maxValue: 100,
                  onChange: (value) {
                    print(value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 30.0,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(icon: Icon(Icons.hot_tub, color: Colors.white), onPressed: () {}),
            IconButton(icon: Icon(Icons.add_a_photo, color: Colors.white), onPressed: () {})
          ],
        ),
      ),
      floatingActionButton: SaveButton(
          successCallback: () => this.setState(() {
                this.bill = BillModel.build();
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  List<SingleElectionItem> _purchaseModeList = List.generate(5, (index) => SingleElectionItem('采购方式' + index.toString(), index.toString()));

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
  SaveButton({this.successCallback});

  final Function successCallback;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        if (this.successCallback != null) this.successCallback();
        this._showSnackBar(context, '保存成功', true);
      },
      foregroundColor: Colors.white,
      backgroundColor: Colors.cyan,
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
      action: SnackBarAction(label: '关 闭', textColor: Colors.black54, onPressed: () {}),
      duration: Duration(seconds: 3),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
```