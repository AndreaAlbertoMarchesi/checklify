import 'package:checklist_app/sharedWidgets/CountdownText.dart';
import 'package:checklist_app/sharedWidgets/DeadlineText.dart';
import 'package:checklist_app/sharedWidgets/PercentageCircle.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
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
            BoxShadow(
              color: appState.task.colorValue != null
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
                if (appState.task.deadline != null)
                  DeadlineText(appState.task.deadline),
                Expanded(child: Container()),
                if (appState.task.deadline != null)
                  CountdownText(
                      appState.task.deadline, appState.task.percentage),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text:appState.task.title,
                        style: TextStyle(
                          fontSize: settings.getFontSizeParent(),
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          color: settings.getFontTiles(),
                        ),
                      ),
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
