import 'package:flutter/cupertino.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountdownText extends StatelessWidget {
  CountdownText(this._deadline, this.percentage);

  final DateTime _deadline;
  final num percentage;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final Duration countdown = _deadline.difference(DateTime.now());

    getTextTimeLeft() {
      if (countdown.inDays >= 1) {
        return Text(
          "Days left: " + countdown.inDays.toString(),
          style: TextStyle(
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: settings.getFontTiles(),
          ),
        );
      } else if (countdown.inHours < 0) {
        if (percentage < 1)
          return Text(
            "expired",
            style: TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles(),
            ),
          );
        else
          return Text(
            "completed",
            style: TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles(),
            ),
          );
      } else {
        return Text(
          "Hours left: " + countdown.inHours.toString(),
          style: TextStyle(
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: settings.getFontTiles(),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,13,10,8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: countdown.inDays > 2
              ? Colors.lightGreen
              : countdown.inDays < 1
                  ? Colors.redAccent
                  : Colors.orangeAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: getTextTimeLeft(),
        ),
      ),
    );
  }
}
