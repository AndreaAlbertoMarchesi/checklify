import 'package:flutter/cupertino.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountdownText extends StatelessWidget {
  CountdownText(this._deadline);

  final DateTime _deadline;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    final Duration countdown = _deadline.difference(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(9.0),
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
          child: Text(
            countdown.inDays >= 1
                ? "Days left: " + countdown.inDays.toString()
                : "Hours left: " + countdown.inHours.toString(),
            style: TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles(),
            ),
          ),
        ),
      ),
    );
  }
}
