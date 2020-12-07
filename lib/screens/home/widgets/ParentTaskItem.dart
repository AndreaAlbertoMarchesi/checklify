import 'file:///C:/Users/AndreaMarchesi/AndroidStudioProjects/checklify/lib/screens/home/widgets/tasksList/widgets/widgets/Items/CountdownText.dart';
import 'file:///C:/Users/AndreaMarchesi/AndroidStudioProjects/checklify/lib/screens/home/widgets/tasksList/widgets/widgets/Items/DeadlineText.dart';
import 'package:checklist_app/sharedWidgets/PercentageCircle.dart';
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
          borderRadius: BorderRadius.circular(8.0),
          color: appState.task.colorValue != null
              ? Color(appState.task.colorValue)
              : settings.getColor(),
          boxShadow: [
            BoxShadow(color: appState.task.colorValue != null
                ? settings.getHighlightedColor(appState.task.colorValue)
                : settings.getFontTiles(),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (appState.task.dateTime != null) DeadlineText(appState.task.dateTime),
                Expanded(child: Container()),
                if (appState.task.dateTime != null) CountdownText(appState.task.dateTime),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    appState.task.title,
                    style: TextStyle(
                      fontSize: settings.getFontSizeParent(),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      color: settings.getFontTiles(),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                PercentageCircle(appState.task),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
