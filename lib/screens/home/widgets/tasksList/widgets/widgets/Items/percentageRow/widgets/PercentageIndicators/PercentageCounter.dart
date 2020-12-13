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
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,15,9),
      child: Transform.scale(
        scale: 1.2,
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
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Counter(
              maxValue: max != null ? max : 1,
              minValue: 0,
              decimalPlaces: 0,
              color: settings.getColor(),
              textStyle: TextStyle(
                color: settings.getFontTiles(),
                fontSize: settings.getFontSizeChildren(),
                fontWeight: FontWeight.bold,
              ),
              onChanged: (num value) {
                if(value<=max && value>=0)
                  appState.updatePercentage(task, value/max);
              },
              initialValue: max != null ? (task.percentage*max).round() : 0,
            ),
          ),
        ),
      ),
    );
  }
}
