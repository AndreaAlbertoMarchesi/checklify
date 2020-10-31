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

    final darkState = context.watch<DarkThemeState>();


    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(10),
        color: Styles.getColor(darkState.darkTheme),
        boxShadow: [
          BoxShadow(color: Styles.getBorder(darkState.darkTheme), spreadRadius: 2, blurRadius: 2),
        ],
      ),
      constraints: BoxConstraints(maxHeight: 50),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                task.title,
                style: TextStyle(
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
              radius: 42.0,
              lineWidth: 8.0,
              percent: task.percentage.toDouble(),
              animation: true,
              animateFromLastPercent: true,
              backgroundColor: Styles.getColor(darkState.darkTheme),
              circularStrokeCap: CircularStrokeCap.round,
              center: isCompleted(task.percentage.toDouble(), darkState.darkTheme),
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
  Widget isCompleted(num percentage, bool isDarkTheme){
    if((percentage*100) == 100.0){
      return Icon(
        IconData(0xe0de, fontFamily: 'MaterialIcons'),
        color: Colors.greenAccent[700],
      );
    }else
      return Text(
        (task.percentage * 100).toInt().toString() + "%",
        style: TextStyle(
          fontSize: 11,
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: Styles.getFont(isDarkTheme),
        ),
      );
  }
}
