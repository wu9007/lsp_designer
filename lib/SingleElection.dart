import 'package:flutter/material.dart';

/// 单选按钮组
/// Created by Shusheng.
class SingleElection extends StatefulWidget {
  final List<SingleElectionItem> list;
  final OnPressedFunction onPressed;
  final MaterialColor color;
  final dynamic value;

  @override
  State<StatefulWidget> createState() => new SingleElectionState();

  SingleElection.build(
      {@required this.list,
      @required this.value,
      @required this.onPressed,
      this.color});
}

class SingleElectionState extends State<SingleElection> {
  MaterialColor color;

  @override
  void initState() {
    super.initState();
    if (widget.color != null) color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.color != null) {
      color = widget.color;
    } else {
      color = Theme.of(context).primaryColor;
    }
    return widget.list != null
        ? Wrap(
            children: List<Widget>.generate(widget.list.length, (index) {
            bool selected = widget.list[index].value == widget.value;
            return Container(
              height: 30,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: FlatButton(
                color: selected ? color[50] : Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: selected ? color : Colors.grey)),
                child: Text(
                  widget.list[index].label,
                  style: new TextStyle(color: selected ? color : Colors.black),
                ),
                onPressed: () {
                  widget.onPressed(widget.list[index]);
                },
              ),
            );
          }))
        : Container();
  }
}

class SingleElectionItem {
  String label;
  dynamic value;

  SingleElectionItem(this.label, this.value);

  SingleElectionItem.fromJson(Map<String, dynamic> json, {labelName, valueName})
      : label = json[labelName ?? 'label'] ?? '',
        value = json[valueName ?? 'value'] ?? '';

  static List<SingleElectionItem> allFromJson(List jsonList,
      {labelName, valueName}) {
    return jsonList
        .map((json) => SingleElectionItem.fromJson(json,
            labelName: labelName, valueName: valueName))
        .toList();
  }
}

typedef void OnPressedFunction(SingleElectionItem item);
