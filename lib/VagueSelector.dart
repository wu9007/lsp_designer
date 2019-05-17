import 'package:flutter/material.dart';
import 'package:lsp_designer/CircularSheet.dart';
/// 底部列表模糊查询选择器
/// Created by Shusheng.
class VagueSelector<D, V, C> extends StatefulWidget {
  VagueSelector.build(
      {@required this.label,
      @required this.value,
      @required this.placeholder,
      @required this.list,
      @required this.onPressed});

  final Text label;
  final V value;
  final String placeholder;
  final List<SelectorItem<D, V, C>> list;
  final OnPressedFunction onPressed;

  @override
  State<StatefulWidget> createState() => new VagueSelectorState();
}

class VagueSelectorState<D, V, C> extends State<VagueSelector<D, V, C>> {
  final TextEditingController _controller = new TextEditingController();
  String _searchContent;
  String _display;

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          widget.label,
          Expanded(
            child: Container(
              height: 31,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.grey[350]))),
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      valid
                          ? this._display ?? widget.placeholder
                          : widget.placeholder,
                      style: TextStyle(
                          fontSize: 16,
                          color: valid ? Colors.black : Colors.black54),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(),
                    icon: Icon(Icons.more_horiz, color: Colors.black54),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return CircularSheet(
                            head: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: "Search...",
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                contentPadding: EdgeInsets.only(
                                    left: 10, bottom: 0, top: 22),
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.only(top: 12),
                                  icon: Icon(Icons.search),
                                  onPressed: () => print('searching...'),
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildFilterItem() {
    List<SelectorItem<D, V, C>> filterList;
    if (this._searchContent == null || this._searchContent.isEmpty) {
      filterList = widget.list;
    } else {
      filterList = List();
      for (int i = 0; i < widget.list.length; i++) {
        SelectorItem item = widget.list.elementAt(i);
        if (item.content
            .toLowerCase()
            .contains(this._searchContent.toLowerCase())) {
          filterList.add(item);
        }
      }
    }
    return filterList
        .map(
          (item) => GestureDetector(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.black26, width: 0.5))),
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: Text(
                    item.content.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                onTap: () {
                  this.setState(() {
                    this._display = item.display.toString();
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

class SelectorItem<D, V, C> {
  D display;
  V value;
  C content;

  SelectorItem(
      {@required this.display, @required this.value, @required this.content});
}

typedef void OnPressedFunction(value);
