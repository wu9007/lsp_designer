import 'package:flutter/material.dart';

class Snack {
  BuildContext context;

  Snack.of(this.context);

  showSnackBar(
      {@required String content,
      @required Color backgroundColor,
      IconData icon = Icons.notifications_active}) {
    final snackBar = SnackBar(
      content: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(icon, color: Colors.white),
          ),
          Text(
            content,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      action: SnackBarAction(
          label: '关 闭', textColor: Colors.white, onPressed: () {}),
      duration: Duration(seconds: 3),
    );
    Scaffold.of(this.context).showSnackBar(snackBar);
  }
}
