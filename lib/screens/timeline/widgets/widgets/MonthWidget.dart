import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget(this.prevDeadLine, this.currentDeadLine, this.getMonth);

  final DateTime prevDeadLine;
  final DateTime currentDeadLine;
  final Function getMonth;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return prevDeadLine == null
        ? Center(
            child: AppTextDecoration(getMonth(currentDeadLine.month),
                fontSize: 12,
                color: settings.getFont(),
                fontStyle: FontStyle.italic))
        : prevDeadLine.month < currentDeadLine.month ||
                prevDeadLine.year < currentDeadLine.year
            ? AppTextDecoration(getMonth(currentDeadLine.month),
                fontSize: 11,
                color: settings.getFont(),
                fontStyle: FontStyle.italic)
            : Text("");
  }
}
