import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
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
          child: Text(
              getMonth(currentDeadLine.month),
              style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0.6,
                  color: settings.getFont(),
                  fontStyle: FontStyle.italic),
            ),
        )
        : prevDeadLine.month < currentDeadLine.month ||
                prevDeadLine.year < currentDeadLine.year
            ? Text(
                getMonth(currentDeadLine.month),
                style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 0.6,
                    color: settings.getFont(),
                    fontStyle: FontStyle.italic),
              )
            : Text("");
  }
}
