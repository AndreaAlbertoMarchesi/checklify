import 'dart:developer';

import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:provider/provider.dart';

class PercentageCounter extends StatelessWidget {
  PercentageCounter(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    final max = task.counterMax;
    return Counter(
      maxValue: max,
      minValue: 0,
      decimalPlaces: 0,
      
      onChanged: (num value) {
        print(value);
        if(value<=max && value>0)
          appState.updateTask(task, percentage: value/max);
      },
      initialValue: (task.percentage*max).round(),
    );

    /*Counter(
      maxValue: task.counterMax,
      minValue: 0,
      decimalPlaces: 0,
      onChanged: (num value) {
        appState.updateTask(task, percentage: value);
      },
      initialValue: task.percentage,

    );*/
  }
}
