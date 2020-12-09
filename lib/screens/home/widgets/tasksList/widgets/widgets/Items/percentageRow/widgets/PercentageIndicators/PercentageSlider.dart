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

    return Slider(
      value: task.percentage.toDouble(),
      onChanged: (double value) {
        appState.updatePercentage(task, value);
      },
    );
  }
}
