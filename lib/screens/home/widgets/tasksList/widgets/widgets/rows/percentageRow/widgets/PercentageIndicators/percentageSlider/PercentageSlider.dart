import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/PercentageIndicators/percentageSlider/widgets/PercentageSliderDialog.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class PercentageSlider extends StatelessWidget {
  PercentageSlider(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 12, 15),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(50),
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
            padding: const EdgeInsets.fromLTRB(8,14,8,14),
            child: LinearPercentIndicator(
              width: 55,
              lineHeight: 14.0,
              percent: task.percentage.toDouble(),
              animation: true,
              backgroundColor: Colors.grey[300],
              progressColor: Colors.lightGreen,
            ),
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Material(
              type: MaterialType.transparency,
              child: Center(
                child: PercentageSliderDialog(task),
              ),
            ),
          );
        },
      ),
    );

    /*Padding(
      padding: const EdgeInsets.fromLTRB(0,7,3,7),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: settings.getHighlightedColor(task.colorValue),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Slider(
          value: task.percentage.toDouble(),
          divisions: task.sliderDivisions != null
                      ? task.sliderDivisions
                      : 3,
          onChanged: (double value) {
            appState.updatePercentage(task, value);
          },
        ),
      ),
    );*/
  }
}
