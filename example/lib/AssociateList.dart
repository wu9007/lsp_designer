import 'package:flutter/material.dart';
import 'package:lsp_designer/CircularSheet.dart';


class AssociateList extends StatefulWidget {
  AssociateList(
      {@required this.value,
      @required this.associateList,
      @required this.onPressed});

  final List associateList;
  final dynamic value;
  final OnPressed onPressed;

  @override
  State<StatefulWidget> createState() => new AssociateListState();
}

class AssociateListState extends State<AssociateList> {
  final TextEditingController _controller = new TextEditingController();
  String _searchContent;

  AssociateListState() {
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '关联单据：',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
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
                      widget.value ?? '',
                      style: TextStyle(fontSize: 16),
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
    List<String> filterList;
    if (this._searchContent == null || this._searchContent.isEmpty) {
      filterList = widget.associateList;
    } else {
      filterList = List();
      for (int i = 0; i < widget.associateList.length; i++) {
        String item = widget.associateList.elementAt(i);
        if (item.toLowerCase().contains(this._searchContent.toLowerCase())) {
          filterList.add(item);
        }
      }
    }
    return filterList
        .map(
          (item) => GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: Text(item),
                ),
                onTap: () {
                  Navigator.of(context).pop(item);
                },
              ),
        )
        .toList();
  }
}

typedef void OnPressed(value);
