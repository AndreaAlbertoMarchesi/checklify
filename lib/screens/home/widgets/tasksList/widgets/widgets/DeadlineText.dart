import 'package:flutter/cupertino.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:provider/provider.dart';

class DeadlineText extends StatelessWidget {
  DeadlineText(this._dateTime);

  final DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        _dateTime.year.toString() +"/"+
            _dateTime.month.toString() + "/"+
            _dateTime.day.toString() + "  "+
            _dateTime.hour.toString() + ":"+
            _dateTime.minute.toString(),
        style: TextStyle(
          letterSpacing: 0.5,
          fontWeight: FontWeight.bold,
          color: settings.getFontTiles(),
        ),
      ),
    );
  }
}
