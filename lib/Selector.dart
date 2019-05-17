import 'package:flutter/material.dart';

/// 下拉列表
/// Created by Shusheng.
class Selector<T> extends StatefulWidget {
  Selector(
      {@required this.value,
      @required this.label,
      @required this.hint,
      @required this.store,
      @required this.onChange});

  final T value;
  final Widget label;
  final Widget hint;
  final List<DropdownMenuItem<T>> store;
  final Function onChange;

  @override
  State<StatefulWidget> createState() => new SelectorState();
}

class SelectorState<T> extends State<Selector<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          widget.label,
          Expanded(
            child: DropdownButton(
              hint: Container(
                child: widget.hint,
              ),
              value: widget.value,
              items: widget.store,
              onChanged: widget.onChange,
              isExpanded: true,
              iconSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
