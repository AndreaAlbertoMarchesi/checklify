import 'package:checklist_app/screens/timeline/widgets/widgets/MonthWidget.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
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

    getChild() {
      return Center(
        child: ListTile(
          title: AppTextDecoration(
              durationFromLastDeadline.inDays.toString() +
                  "   days between tasks",
              color: settings.getFont()),
          subtitle: AppTextDecoration(
              durationFromNow.inDays.toString() + "   days from now",
              fontSize: settings.getFontSizeCoffee(),
              color: settings.getFont()),
        ),
      );
    }

    return durationFromLastDeadline.inDays.toDouble() <= 2
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getChild(),
              MonthWidget(prevDeadline, currentDeadline, settings.getMonth)
            ],
          )
        : Column(
            children: [
              Container(
                  height: durationFromLastDeadline.inDays.toDouble() > 31
                      ? 600
                      : 20 * durationFromLastDeadline.inDays.toDouble(),
                  child: getChild()),
              Container(
                  height: 12,
                  child: MonthWidget(
                      prevDeadline, currentDeadline, settings.getMonth)),
            ],
          );
  }
}
