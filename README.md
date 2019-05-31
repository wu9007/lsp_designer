# lsp_designer

[![License][license-image]][license-url] 
[![Pub](https://img.shields.io/pub/v/lsp_designer.svg?style=flat-square)](https://pub.dartlang.org/packages/lsp_designer)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/4e4dae89975e4781a7d6ea2d2d8752d7)](https://www.codacy.com/app/leyan95/lsp_designer?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=leyan95/lsp_designer&amp;utm_campaign=Badge_Grade)

A practical component library from Logistics Service Management Product Group feels silky and smooth when used. 🚀

[github](https://github.com/leyan95/lsp_designer)

![lsp_designer.gif](https://upload-images.jianshu.io/upload_images/3646846-7dd1837bedd46914.gif?imageMogr2/auto-orient/strip)

```yaml
dependencies:
 lsp_designer: ^0.1.15
```

## Usage example
### SingleElection 
#### `SingleElection`
`SingleElection.build(
            {@required this.list,
            @required this.value,
            @required this.onPressed,
            this.color});`

#### `SingleElectionItem`
`SingleElectionItem(this.label, this.value);`


```dart
SingleElection.build(
    value: this._billType,
    color: Colors.orange,
    list: List.generate(
                2,
                (index) =>
                    SingleElectionItem('开单类型' + index.toString(), index.toString())),
    onPressed: (item) =>
        this.setState(() => this._billType = item.value),
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
    value: this._payMode,
    label: Text(
      '付款方式：',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ),
    hint: Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Text('请选择付款方式'),
    ),
    store: List.generate(
                   5,
                   (index) => DropdownMenuItem(
                         value: '001' + index.toString(),
                         child: Container(
                           padding: EdgeInsets.only(left: 10),
                           child: Text('付款方式' + index.toString()),
                         ),
                       )),
    onChange: (item) => this.setState(() => this._payMode = item),
)
```

### `CircularSheet`
`CircularSheet(
            {this.head, @required this.child, this.borderRadius, this.height});`
  
```dart
CircularSheet(
  head: Text(
    'TITLE',
    style: TextStyle(
      fontSize: 15,
      color: Colors.black45,
    ),
  ),
  child: Container(color: Colors.blue),
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
    value: this._associateBill,
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
      this.setState(() => this._associateBill = value);
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