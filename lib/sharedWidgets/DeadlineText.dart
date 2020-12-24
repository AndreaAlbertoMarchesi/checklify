import 'package:checklist_app/utils/DateTimeFormatter.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TextStyles/AppTextDecoration.dart';

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
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 4, 4, 0),
            child: Icon(
              Icons.watch_later_outlined,
              color: settings.getFontTiles(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 4, 0, 0),
            child: AppTextDecoration(
                DateTimeFormatter.monthToString(_dateTime.month) +
                    " " +
                    _dateTime.day.toString() +
                    (_dateTime.year != DateTime.now().year
                        ? ", " + _dateTime.year.toString()
                        : ""),
                letterSpacing: 0.5,
                fontStyle: FontStyle.italic,
                color: settings.getFontTiles()),
          ),
        ],
      ),
    );
  }
}
