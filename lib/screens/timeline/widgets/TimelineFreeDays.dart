import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/screens/home/widgets/ParentTaskItem.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/CountdownText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/DeadlineText.dart';
import 'package:checklist_app/sharedWidgets/PercentageCircle.dart';
import 'package:checklist_app/states/AppState.dart';
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
    final Duration durationFromLastDeadline = currentDeadline.difference(prevDeadline);
    final Duration durationFromNow = currentDeadline.difference(DateTime.now());


    print(currentDeadline);
    print(prevDeadline);

    return Container(
      color: Colors.grey,
      height: 10*durationFromLastDeadline.inDays.toDouble(),
      child:
    ListTile(
        title: Text(durationFromLastDeadline.inDays.toString()),
        subtitle: Text(durationFromNow.inDays.toString()),
      ),
    );
  }

  bool haveSameDate(DateTime deadline, DateTime prevDeadline) {
    return prevDeadline == null
        ? false
        : deadline.month == prevDeadline.month &&
        deadline.day == prevDeadline.day;
  }
}