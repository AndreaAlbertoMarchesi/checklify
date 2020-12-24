import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageWidget extends StatelessWidget {
  PercentageWidget(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 45,
        height: 40,
        child: Center(
          child: AppTextDecoration(
              (task.percentage * 100).round().toString() + "%",
              fontSize: settings.getFontSizeCoffee(),
              color: settings.getFontTiles()),
          //todo 0.5
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
          color: Colors.white60,
          boxShadow: [
            BoxShadow(
              color: Colors.white60,
              spreadRadius: 0.0,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
      ),
    );
  }
}
