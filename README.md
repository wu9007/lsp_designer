# lsp_designer

[![License][license-image]][license-url] 
[![Pub](https://img.shields.io/pub/v/lsp_designer.svg?style=flat-square)](https://pub.dartlang.org/packages/lsp_designer)

A Practical Component Library for Logistics Management System 🚀

[github](https://github.com/leyan95/lsp_designer)

![lsp_designer.gif](https://upload-images.jianshu.io/upload_images/3646846-7dd1837bedd46914.gif?imageMogr2/auto-orient/strip)

```
dependencies:
 lsp_designer: ^0.1.0
```

## Usage example
### SingleElection 
#### `SingleElection<T>`
`SingleElection.build(
            {@required this.list,
            @required this.value,
            @required this.onPressed,
            this.color});`

#### `SingleElectionItem<T>`
`SingleElectionItem(this.label, this.value);`


```dart
SingleElection<String>.build(
    value: this.bill.billType,
    color: Colors.orange,
    list: this._billTypeList,
    onPressed: (item) =>
        this.setState(() => this.bill.billType = item.value),
)
```

### Selector
`Selector(
            {@required this.value,
            @required this.label,
            @required this.hint,
            @required this.store,
            @required this.onChange});`
            
```dart
Selector(
    value: this.bill.payMode,
    label: Text(
      '付款方式：',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ),
    hint: Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Text('请选择付款方式'),
    ),
    store: this._payModeStore(),
    onChange: (item) => this.setState(() => this.bill.payMode = item),
)
```

### `CircularSheet`
`CircularSheet(
            {this.head, @required this.child, this.borderRadius, this.height});`
  
```dart
CircularSheet(
  head: Text(
    '请选择入库单',
    style: TextStyle(
      fontSize: 15,
      color: Colors.black45,
    ),
  ),
  child: DynamicListView.build(
      itemBuilder: _itemBuilder,
      dataRequester: _dataRequester,
      initRequester: _initRequester),
)
```

### VagueSelector
- D 文本框显示的内容
- V 存储的内容
- C 下拉列表每行的显示的内容
#### VagueSelector<D, V, C>
`VagueSelector.build(
            {@required this.label, @required this.list, @required this.onPressed});`
#### SelectorItem<D, V, C>
`SelectorItem(
            {@required this.display, @required this.value, @required this.content});`

```dart
VagueSelector.build(
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
)
```
## Contribute

We would ❤️ to see your contribution!

## License

Distributed under the MIT license. See ``LICENSE`` for more information.

## About

Created by Shusheng.

[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE