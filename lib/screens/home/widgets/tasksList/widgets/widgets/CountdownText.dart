import 'package:flutter/cupertino.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:provider/provider.dart';

class CountdownText extends StatelessWidget {
  CountdownText(this._dateTime);

  final DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    final Duration countdown = _dateTime.difference(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        countdown.inDays > 1
            ? "days left: " + countdown.inDays.toString()
            : "hours left: " + countdown.inHours.toString(),
        style: TextStyle(
          letterSpacing: 0.5,
          fontWeight: FontWeight.bold,
          color: settings.getFontTiles(),
        ),
      ),
    );
  }
}
