import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageCheckbox extends StatelessWidget {
  PercentageCheckbox(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 12, 12),
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
        child: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            activeColor: Colors.greenAccent[700],
            checkColor: settings.getFontTiles(),
            value: task.percentage == 1,
            onChanged: (bool value) {
              appState.updatePercentage(
                  task, task.percentage == 0 ? 1 : 0);
            },
          ),
        ),
      ),
    );
  }
}
