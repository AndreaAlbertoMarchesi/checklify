import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
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
        return AppTextDecoration("Days left: " + countdown.inDays.toString(),
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: settings.getFontTiles());
      } else if (countdown.inHours < 0) {
        if (percentage < 1)
          return AppTextDecoration("Expired",
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles());
        else
          return AppTextDecoration("Completed",
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles());
      } else {
        return AppTextDecoration("Hours left: " + countdown.inHours.toString(),
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: settings.getFontTiles());
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 13, 10, 8),
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
