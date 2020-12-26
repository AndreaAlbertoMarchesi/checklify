import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/PercentageIndicators/percentageCounter/widgets/PercentageCounterDialog.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageCounter extends StatelessWidget {
  PercentageCounter(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 19, 15),
      child: Transform.scale(
        scale: 1.3,
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: settings.getHighlightedColor(task.colorValue),
                  blurRadius: 0.0,
                  spreadRadius: 1.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AppTextDecoration((task.percentage * task.counterMax).round().toString() +
                  "/" +
                  task.counterMax.toString(),
                color: settings.getFontTiles()),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Material(
                type: MaterialType.transparency,
                child: Center(
                  child: PercentageCounterDialog(task),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
