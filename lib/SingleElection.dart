import 'package:flutter/material.dart';

/// 单选按钮组
/// Created by Shusheng.
class SingleElection<T> extends StatefulWidget {
  final List<SingleElectionItem<T>> list;
  final OnPressedFunction onPressed;
  final MaterialColor color;
  final T value;

  @override
  State<StatefulWidget> createState() => new SingleElectionState<T>();

  SingleElection.build(
      {@required this.list,
      @required this.value,
      @required this.onPressed,
      this.color});
}

class SingleElectionState<T> extends State<SingleElection> {
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
    return Wrap(
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
    }));
  }
}

class SingleElectionItem<T> {
  String label;
  T value;

  SingleElectionItem(this.label, this.value);
}

typedef void OnPressedFunction(SingleElectionItem item);
