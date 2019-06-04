import 'package:flutter/material.dart';

/// 底部提示
/// Created by Shusheng.
class Snack {
  BuildContext _context;

  Snack.of(context);

  showSnackBar(
      {@required String content,
      @required Color backgroundColor,
      IconData icon = Icons.notifications_active}) {
    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(icon, color: Colors.black),
          ),
          Text(
            content,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      action: SnackBarAction(
          label: '关 闭', textColor: Colors.black54, onPressed: () {}),
      duration: Duration(seconds: 3),
    );
    Scaffold.of(_context).showSnackBar(snackBar);
  }
}
