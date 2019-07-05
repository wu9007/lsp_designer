library multiple_select;

import 'package:flutter/material.dart';

import 'multiple_select_item.dart';
import 'multiple_select_route.dart';


class MultipleSelect {
  ///
  /// Display multiple selector bottom sheet.
  ///
  static Future showMultipleSelector(BuildContext context, {@required List<MultipleSelectItem> dataList}) {
    return Navigator.push(
      context,
      MultipleSelectRoute<List<MultipleSelectItem>>(barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel, dataList: dataList),
    );
  }
}
