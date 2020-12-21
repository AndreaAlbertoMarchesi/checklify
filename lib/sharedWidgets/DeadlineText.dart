import 'package:checklist_app/utils/DateTimeFormatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class DeadlineText extends StatelessWidget {
  DeadlineText(this._dateTime);

  final DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.watch_later_outlined),
            onPressed: () {},
          ),
          Text(
            DateTimeFormatter.monthToString(_dateTime.month) +
                " " +
                _dateTime.day.toString() +
                (_dateTime.year != DateTime.now().year
                    ? ", " + _dateTime.year.toString()
                    : "")
            /*
                "/" +
                _dateTime.day.toString() +
                "  " +
                _dateTime.hour.toString() +
                ":" +
                _dateTime.minute.toString()*/
            ,
            style: TextStyle(
              letterSpacing: 0.5,
              fontStyle: FontStyle.italic,
              color: settings.getFontTiles(),
            ),
          ),
        ],
      ),
    );
  }
}
