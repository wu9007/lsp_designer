import 'package:flutter/material.dart';
import 'package:lsp_designer/card/CircularSheet.dart';

/// 底部列表模糊查询选择器
/// Created by Shusheng.
class VagueSelector extends StatefulWidget {
  VagueSelector.build({
    Key key,
    @required this.label,
    @required this.value,
    @required this.placeholder,
    @required this.list,
    @required this.onPressed,
    this.disabled = false,
  }) : super(key: key);

  final Text label;
  final dynamic value;
  final String placeholder;
  final List<SelectorItem> list;
  final OnPressedFunction onPressed;
  final bool disabled;

  @override
  State<StatefulWidget> createState() => new VagueSelectorState();
}

class VagueSelectorState extends State<VagueSelector> {
  final TextEditingController _controller = new TextEditingController();
  String _searchContent;

  VagueSelectorState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _searchContent = "";
        });
      } else {
        setState(() {
          _searchContent = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool valid = widget.value != null;
    String display;
    if (valid && widget.list != null && widget.list.length > 0) {
      SelectorItem item = widget.list.singleWhere((item) => item.value == widget.value, orElse: () => (null));
      display = item != null ? item.display : widget.value;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          widget.label,
          Expanded(
            child: Opacity(
              opacity: widget.disabled ? 0.4 : 1,
              child: GestureDetector(
                child: Container(
                  height: 31,
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey[350]))),
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          valid ? display ?? '' : widget.placeholder,
                          style: TextStyle(fontSize: 16, color: valid ? Colors.black : Colors.black54),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.5),
                        child: Icon(Icons.list, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  if (!widget.disabled)
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CircularSheet(
                          head: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              contentPadding: EdgeInsets.only(left: 10, bottom: 0, top: 22),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Icon(Icons.search),
                              ),
                            ),
                          ),
                          child: ListView(
                            children: this._buildFilterItem(),
                          ),
                        );
                      },
                    ).then((value) {
                      widget.onPressed(value);
                    });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildFilterItem() {
    List<SelectorItem> filterList;
    if (this._searchContent == null || this._searchContent.isEmpty) {
      filterList = widget.list ?? new List();
    } else {
      filterList = List();
      for (int i = 0; i < widget.list.length; i++) {
        SelectorItem item = widget.list.elementAt(i);
        if (item.content.toLowerCase().contains(this._searchContent.toLowerCase())) {
          filterList.add(item);
        }
      }
    }
    return filterList
        .map(
          (item) => GestureDetector(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26, width: 0.5))),
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: Text(
                    item.content.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                onTap: () {
                  if (!this.mounted) return;
                  this.setState(() {
                    this._searchContent = "";
                  });
                  this._controller.clear();
                  Navigator.of(context).pop(item.value);
                },
              ),
        )
        .toList();
  }
}

class SelectorItem {
  dynamic display;
  dynamic value;
  dynamic content;

  SelectorItem({@required this.display, @required this.value, @required this.content});

  SelectorItem.fromJson(Map<String, dynamic> json, {display, valueName, content})
      : display = json[display ?? 'label'] ?? '',
        value = json[valueName ?? 'value'] ?? '',
        content = json[content ?? 'content'] ?? '';

  static List<SelectorItem> allFromJson(List jsonList, {display, valueName, content}) {
    return jsonList.map((json) => SelectorItem.fromJson(json, display: display, valueName: valueName, content: content)).toList();
  }
}

typedef void OnPressedFunction(value);
