import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PercentageCircle extends StatelessWidget {
  PercentageCircle(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final percentage = task.percentage;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 6, 6, 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: task.colorValue != null
                  ? settings.getHighlightedColor(task.colorValue)
                  : settings.getShadowParent(),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
          child: CircularPercentIndicator(
            radius: settings.getPercentageSizeChildren(),
            lineWidth: 7.0,
            percent: percentage.toDouble(),
            animation: true,
            animateFromLastPercent: true,
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.round,
            center: (percentage * 100).round() == 100
                ? Icon(
                    const IconData(0xe0de, fontFamily: 'MaterialIcons'),
                    color: Colors.lightGreen[900],
                    size: settings.getFontSizeParent() - 3,
                  )
                : Text(
                    (percentage * 100).round().toString() + "%",
                    style: TextStyle(
                      fontSize: settings.getFontPercentageChildren(),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: settings.getFontTiles(),
                    ),
                  ),
            linearGradient: LinearGradient(colors: [
              Colors.green[600],
              Colors.lightGreen,
            ]),
          ),
        ),
      ),
    );
  }
}
