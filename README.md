# lsp_designer

[![License][license-image]][license-url] 
[![Pub](https://img.shields.io/pub/v/lsp_designer.svg?style=flat-square)](https://pub.dartlang.org/packages/lsp_designer)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/4e4dae89975e4781a7d6ea2d2d8752d7)](https://www.codacy.com/app/leyan95/lsp_designer?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=leyan95/lsp_designer&amp;utm_campaign=Badge_Grade)

A practical component library from Logistics Service Management Product Group feels silky and smooth when used. 🚀

[github](https://github.com/leyan95/lsp_designer)

![lsp_designer.gif](https://upload-images.jianshu.io/upload_images/3646846-7dd1837bedd46914.gif?imageMogr2/auto-orient/strip)

```yaml
dependencies:
 lsp_designer: ^0.1.38
```

## Usage example

```dart
import 'package:flutter/material.dart';
import 'package:lsp_designer/form/SingleElection.dart';
import 'package:lsp_designer/form/Selector.dart';
import 'package:lsp_designer/form/Input.dart';
import 'package:lsp_designer/form/multi_election.dart';
import 'package:lsp_designer/form/constant/style_constant.dart';
import 'package:lsp_designer/form/VagueSelector.dart';
import 'package:lsp_designer/form/NumberField.dart';

var associateBillStore = List<SelectorItem>.generate(
    15, (index) => SelectorItem(display: 'AB-190517' + index.toString(), value: '190517' + index.toString(), content: '单据：AB-190517' + index.toString()));
var acceptorStore = List.generate(
    10, (index) => DropdownMenuItem(value: '001' + index.toString(), child: Container(padding: EdgeInsets.only(left: 10), child: Text('验收人' + index.toString()))));
var supplierStore = List.generate(
    5, (index) => DropdownMenuItem(value: '001' + index.toString(), child: Container(padding: EdgeInsets.only(left: 10), child: Text('测试供应商' + index.toString()))));
var purchaseModeStore = List.generate(5, (index) => SingleElectionItem('采购方式' + index.toString(), index.toString()));

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddBill(),
    );
  }
}

class AddBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AddBillState();
}

class AddBillState extends State<AddBill> {
  BillModel bill = BillModel();
  List _selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('LSP_DESIGNER'),
      ),
      body: ListView(
        children: <Widget>[
          Input(
            leading: Icon(Icons.straighten, color: Colors.black45),
            label: '桌子长度',
            hint: '请输入长度',
            trailing: Text('cm', style: CustomStyle.unitStyle),
          ),
          Divider(height: 1),
          CheckboxListTile(
            secondary: const Icon(Icons.bubble_chart, color: Colors.black45),
            title: Text('是否异常', style: CustomStyle.labelStyle),
            value: false,
            onChanged: (value) {},
          ),
          Divider(height: 1),
          MultiElection.build(
            label: '异常类型',
            leading: Icon(Icons.multiline_chart, color: Colors.black45),
            value: _selectedValues,
            selectedColor: Colors.red,
            list: List.generate(5, (index) => MultiElectionItem('异常类型' + index.toString(), index.toString())),
            onPressed: (item) {
              var value = item.value;
              if (_selectedValues.contains(value)) {
                _selectedValues.remove(value);
              } else {
                _selectedValues.add(value);
              }
              this.setState(() => _selectedValues = _selectedValues);
            },
          ),
          Selector(
            value: this.bill.supplier,
            label: Text('供  应  商：', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            hint: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('请选择供应商'),
            ),
            store: supplierStore,
            onChange: (item) => this.setState(() => this.bill.supplier = item),
          ),
          VagueSelector.build(
            placeholder: '请选择关联单据',
            value: this.bill.associateBill,
            label: Text('关联单据：', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            list: associateBillStore,
            onPressed: (value) => this.setState(() => this.bill.associateBill = value),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('采购方式：', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: SingleElection.build(
                    value: this.bill.purchaseMode,
                    color: Colors.deepOrange,
                    list: purchaseModeStore,
                    onPressed: (item) => this.setState(() => this.bill.purchaseMode = item.value),
                  ),
                ),
              ],
            ),
          ),
          Selector(
            value: this.bill.acceptor,
            label: Text('验  收  人：', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            hint: Container(padding: EdgeInsets.only(left: 10.0), child: Text('请选择验收人')),
            store: acceptorStore,
            onChange: (item) => this.setState(() => this.bill.acceptor = item),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text('数        量：', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                child: NumberField.build(
                  initValue: 0,
                  miniValue: 0,
                  maxValue: 100,
                  onChange: (value) => print(value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BillModel {
  String uuid;
  String supplier;
  String associateBill;
  String purchaseMode;
  String acceptor;
  int quantity;
}
```
## Contribute

We would ❤️ to see your contribution!

## License

Distributed under the MIT license. See ``LICENSE`` for more information.

## About

Created by Shusheng.

[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE