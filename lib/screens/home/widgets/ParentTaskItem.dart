import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ParentTaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Padding(
      padding: EdgeInsets.all(7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: settings.getColor(),
          boxShadow: [
            BoxShadow(color: settings.getBorder(), spreadRadius: 2),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                appState.task.title,
                style: TextStyle(
                  fontSize: settings.getFontSizeParent(),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: settings.getFont(),
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: CircularPercentIndicator(
                radius: settings.getPercentageSizeParent(),
                lineWidth: 8.0,
                percent: appState.task.percentage.toDouble(),
                animation: true,
                animateFromLastPercent: true,
                backgroundColor: settings.getColor(),
                circularStrokeCap: CircularStrokeCap.round,
                center: isCompleted(
                    appState.task,
                    appState.task.percentage.toDouble(),
                    settings),
                linearGradient: LinearGradient(colors: [
                  Colors.green[600],
                  Colors.lightGreen,
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget isCompleted(Task task, num percentage, Settings settings) {
    if ((percentage * 100) == 100.0) {
      return Icon(
        const IconData(0xe0de, fontFamily: 'MaterialIcons'),
        color: Colors.lightGreen[900],
        size: settings.getFontSizeParent(),
      );
    } else
      return Text(
        (task.percentage * 100).toInt().toString() + "%",
        style: TextStyle(
          fontSize: settings.getFontPercentageParent(),
          letterSpacing: 0.5,
          fontWeight: FontWeight.bold,
          color: settings.getFont(),
        ),
      );
  }
}
