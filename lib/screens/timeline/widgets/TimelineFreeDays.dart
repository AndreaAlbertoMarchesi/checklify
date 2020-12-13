import 'package:checklist_app/screens/timeline/widgets/widgets/MonthWidget.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineFreeDays extends StatelessWidget {
  TimelineFreeDays(this.prevDeadline, this.currentDeadline);

  final DateTime prevDeadline;
  final DateTime currentDeadline;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final Duration durationFromLastDeadline =
        currentDeadline.difference(prevDeadline);
    final Duration durationFromNow = currentDeadline.difference(DateTime.now());

    print(currentDeadline);
    print(prevDeadline);

    getChild(){
      return  Center(
        child: ListTile(
          title: Text(
            "Days between tasks "+durationFromLastDeadline.inDays.toString(),
            style: TextStyle(
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: settings.getFont(),
            ),

          ),
          subtitle: Text(
            "Day from now "+durationFromNow.inDays.toString(),
            style: TextStyle(
              letterSpacing: 0.6,
              fontSize: settings.getFontSizeCoffee(),
              color: settings.getFont(),
            ),
          ),
        ),
      );
    }

    return durationFromLastDeadline.inDays.toDouble()<=2
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment :MainAxisAlignment.start,
            children: [
              getChild(),
              MonthWidget(prevDeadline, currentDeadline, settings.getMonth)
            ],
        )
        : Column(
          children: [
            Container(
                height: 20 * durationFromLastDeadline.inDays.toDouble(),
                child:getChild()
            ),
            Container(
                height: 12,
                child: MonthWidget(prevDeadline,currentDeadline,settings.getMonth)
            ),
          ],
        );
  }
}
