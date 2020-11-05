import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PercentageRow extends StatelessWidget {
  PercentageRow(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {

    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Styles.getColor(darkState.darkTheme),
        boxShadow: [
          BoxShadow(color: Styles.getBorder(darkState.darkTheme), spreadRadius: 2),
        ],
      ),
      constraints: BoxConstraints(maxHeight: Styles.getTileSizeChildren(appState.size)),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                task.title,
                style: TextStyle(
                  fontSize: Styles.getFontSizeChildren(appState.size),
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
              radius: Styles.getPercentageSizeChildren(appState.size),
              lineWidth: 7.0,
              percent: task.percentage.toDouble(),
              animation: true,
              animateFromLastPercent: true,
              backgroundColor: Styles.getColor(darkState.darkTheme),
              circularStrokeCap: CircularStrokeCap.round,
              center: isCompleted(task.percentage.toDouble(), darkState.darkTheme, appState.size),
              linearGradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.lightGreen,
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget isCompleted(num percentage, bool isDarkTheme, String size){
    if((percentage*100) == 100.0){
      return Icon(
        const IconData(0xe0de, fontFamily: 'MaterialIcons'),
        color: Colors.greenAccent[700],
        size: Styles.getFontSizeParent(size) -3,
      );
    }else
      return Text(
        (task.percentage * 100).toInt().toString() + "%",
        style: TextStyle(
          fontSize: Styles.getFontPercentageChildren(size),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: Styles.getFont(isDarkTheme),
        ),
      );
  }
}
