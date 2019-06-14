import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingProcess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 62,
        width: 62,
        decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: CupertinoActivityIndicator(
          radius: 30.0,
          animating: true,
        ),
      ),
    );
  }
}
