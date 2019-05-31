import 'package:flutter/material.dart';

/// 弹出窗口持有者
/// Created by Shusheng.
class DialogHolder {
  static Future<bool> showConfirmDialog(BuildContext context,
      {String title, @required Widget body}) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: title != null ? Text(title) : null,
            content: body,
            actions: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.verified_user),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                label: Text("  是"),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              Container(width: 6),
              RaisedButton.icon(
                icon: Icon(Icons.report_problem),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                label: Text("  否"),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ],
          ),
    );
  }
}
