import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageSlider extends StatelessWidget {
  PercentageSlider(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Padding(
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
    );
  }
}
