import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PercentageRow extends StatelessWidget {
  PercentageRow(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            task.title,
            style: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles(),
            ),
          ),
        ),
        Expanded(child: Container()),
        task.isStarred ?
        IconButton(
          icon: Icon(Icons.star, color: Colors.yellowAccent),
          onPressed: (){
            appState.setStarredTask(task, false);
          },
        )
            : IconButton(
          icon: Icon(Icons.star_border, color: Colors.yellowAccent),
          onPressed:(){
            appState.setStarredTask(task, true);
          } ,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 6, 6, 6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: settings.getHighlightedColor(task.colorValue),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
              child: CircularPercentIndicator(
                radius: settings.getPercentageSizeChildren(),
                lineWidth: 7.0,
                percent: task.percentage.toDouble(),
                animation: true,
                animateFromLastPercent: true,
                backgroundColor: Colors.transparent,
                circularStrokeCap: CircularStrokeCap.round,
                center: isCompleted(task.percentage.toDouble(), settings),
                linearGradient: LinearGradient(colors: [
                  Colors.green[600],
                  Colors.lightGreen,
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget isCompleted(num percentage, Settings settings) {
    if ((percentage * 100) == 100.0) {
      return Icon(
        const IconData(0xe0de, fontFamily: 'MaterialIcons'),
        color: Colors.lightGreen[900],
        size: settings.getFontSizeParent() - 3,
      );
    } else
      return Text(
        (task.percentage * 100).toInt().toString() + "%",
        style: TextStyle(
          fontSize: settings.getFontPercentageChildren(),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: settings.getFontTiles(),
        ),
      );
  }
}
