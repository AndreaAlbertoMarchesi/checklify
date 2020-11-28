import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DailyPercentageText extends StatelessWidget {
  DailyPercentageText(this._deadline, this.percentage);

  final DateTime _deadline;
  final num percentage;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    int intPercentage = (percentage * 100).round();

    final Duration countdown = _deadline.difference(DateTime.now());
    return Text(
      "Daily percentage: " +
          (countdown.inDays > 1
                  ? intPercentage / countdown.inDays
                  : intPercentage)
              .toString(),
      style: TextStyle(
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        color: settings.getFontTiles(),
      ),
    );
  }
}
