import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ValueChanged<T> = void Function(T value);
/// Created by Shusheng.
class NumberField extends StatefulWidget {
  final int miniValue;
  final int maxValue;
  final int initValue;
  final ValueChanged<int> onChange;

  NumberField.build(
      {@required this.miniValue,
      @required this.maxValue,
      @required this.initValue,
      @required this.onChange});

  @override
  State<StatefulWidget> createState() => NumberFieldState();
}

class NumberFieldState extends State<NumberField> {
  int _value;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    this._value = widget.initValue;
    this._controller.text = this._value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.1, color: Colors.black26),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (this._value > widget.miniValue) {
                this._value = this._value - 1;
              } else {
                this._value = widget.miniValue;
              }
              this._controller.text = this._value.toString();
              this.widget.onChange(this._value);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Icon(
                Icons.remove,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            width: 40,
            alignment: Alignment.center,
            child: TextField(
              onChanged: (content) {
                int inputValue = int.parse(content);
                if (inputValue > widget.maxValue) {
                  this._value = widget.maxValue;
                } else if (inputValue < widget.miniValue) {
                  this._value = widget.miniValue;
                } else {
                  this._value = inputValue;
                }
                this._controller.text = this._value.toString();
                this.widget.onChange(this._value);
              },
              controller: this._controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]"))
              ],
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
                ),
                contentPadding: EdgeInsets.only(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (this._value < widget.maxValue) {
                this._value = this._value + 1;
              } else {
                this._value = widget.maxValue;
              }
              this._controller.text = this._value.toString();
              this.widget.onChange(this._value);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Icon(
                Icons.add,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }
}
