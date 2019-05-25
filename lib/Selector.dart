import 'package:flutter/material.dart';

/// 下拉列表
/// Created by Shusheng.
class Selector<T> extends StatefulWidget {
  Selector({@required this.value,
    @required this.label,
    @required this.hint,
    @required this.store,
    @required this.onChange,
    this.disabled = false})
      : assert(store == null ||
      store.isEmpty ||
      value == null ||
      store
          .where((DropdownMenuItem<T> item) => item.value == value)
          .length ==
          1);

  final T value;
  final Widget label;
  final Widget hint;
  final List<DropdownMenuItem<T>> store;
  final Function onChange;
  final bool disabled;

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
              child: Opacity(
                opacity: widget.disabled ? 0.5 : 1,
                child: DropdownButton(
                  iconDisabledColor: Colors.black54,
                  iconEnabledColor: Colors.black54,
                  hint: Container(
                    child: widget.hint,
                  ),
                  value: widget.value,
                  items: widget.store,
                  onChanged: widget.disabled ? (value) => {} : widget.onChange,
                  isExpanded: true,
                  iconSize: 35,
                ),
              )),
        ],
      ),
    );
  }
}
