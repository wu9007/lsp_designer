import 'package:flutter/material.dart';
/// 原角薄片
/// Created by Shusheng.
class CircularSheet extends StatelessWidget {
  final Widget head;
  final Widget child;
  final BorderRadius borderRadius;
  final double height;

  CircularSheet(
      {this.head, @required this.child, this.borderRadius, this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: 25,
        width: double.infinity,
        color: Colors.black54,
      ),
      Container(
        height: this.height ?? 370,
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: this.borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              child: this.head ?? Divider(height: 1),
            ),
            Expanded(
              child: this.child,
            )
          ],
        ),
      ),
    ]);
  }
}
