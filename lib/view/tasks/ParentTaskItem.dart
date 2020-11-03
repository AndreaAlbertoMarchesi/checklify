import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ParentTaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();


    return Padding(
      padding: EdgeInsets.all(7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Styles.getColor(darkState.darkTheme),
          boxShadow: [
            BoxShadow(color: Styles.getBorder(darkState.darkTheme), spreadRadius: 2),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                appState.task.title,
                style: TextStyle(
                  fontSize: 60.0,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: Styles.getFont(darkState.darkTheme),
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: CircularPercentIndicator(
                radius: 47.0,
                lineWidth: 8.0,
                percent: appState.task.percentage.toDouble(),
                animation: true,
                animateFromLastPercent: true,
                backgroundColor: Styles.getColor(darkState.darkTheme),
                circularStrokeCap: CircularStrokeCap.round,
                center: isCompleted(
                    appState.task, appState.task.percentage.toDouble(), darkState.darkTheme),
                linearGradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.lightGreen,
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget isCompleted(Task task, num percentage, bool isDarkTheme) {
    if ((percentage * 100) == 100.0) {
      return Icon(
        IconData(0xe0de, fontFamily: 'MaterialIcons'),
        color: Colors.greenAccent[700],
      );
    } else
      return Text(
        (task.percentage * 100).toInt().toString() + "%",
        style: TextStyle(
          fontSize: 15,
          letterSpacing: 0.5,
          fontWeight: FontWeight.bold,
          color: Styles.getFont(isDarkTheme),
        ),
      );
  }
}
