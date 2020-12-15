import 'package:cell_calendar/cell_calendar.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/screens/timeline/InAppCalendar/InAppCalendar.dart';
import 'package:checklist_app/screens/timeline/widgets/TimeLineStructure.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineFreeDays.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineTask.dart';
import 'package:checklist_app/screens/timeline/widgets/widgets/MonthWidget.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();
    int extra = 0;

    List<Widget> getItems(Task root) {
      List<TaskWithPath> tasksWithPaths = root.getTimelineTasks(TaskPath());
      tasksWithPaths.sort((a, b) => a.task.deadline.compareTo(b.task.deadline));

      List<Widget> items = List<Widget>();
      DateTime previousDeadline;

      if (tasksWithPaths.isNotEmpty) {
        items.add(MonthWidget(
            null, tasksWithPaths.first.task.deadline, settings.getMonth));
        extra++;
      }
      tasksWithPaths.forEach((e) {
        DateTime currentDeadline = e.task.deadline;
        bool hasSameDateAsPrevious =
            haveSameDate(currentDeadline, previousDeadline);

        if (previousDeadline != null &&
            currentDeadline.difference(previousDeadline).inDays > 1) {
          items.add(TimelineFreeDays(previousDeadline, currentDeadline));
          extra++;
        }
        items.add(TimelineTask(e, hasSameDateAsPrevious));

        previousDeadline = e.task.deadline;
      });
      return items;
    }

    List<Icon> getIndicator(Task root) {
      List<TaskWithPath> tasksWithPaths = root.getTimelineTasks(TaskPath());
      List<Icon> items = List<Icon>();

      tasksWithPaths.forEach((element) {
        items.add(Icon(Icons.calendar_today_outlined));
      });

      for (int i = 0; i < extra; i++)
        items.add(Icon(Icons.calendar_today_outlined));
      return items;
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        extendBody: true,
        appBar: AppBar(
          title: Text(
              "TimeLine",

          ),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today_outlined),
              onPressed: () {
                List<TaskWithPath> tasksWithPaths = appState.root.getTimelineTasks(TaskPath());
                tasksWithPaths.sort((a, b) => a.task.deadline.compareTo(b.task.deadline));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InAppCalendar(tasksWithPaths)));
              },
            )
          ],
        ),
        body: TimelineStructure(
          children: getItems(appState.root),
          indicators: getIndicator(appState.root),
          indicatorStyle: PaintingStyle.stroke,
        ));
  }

  bool haveSameDate(DateTime deadline, DateTime prevDeadline) {
    return prevDeadline == null
        ? false
        : deadline.month == prevDeadline.month &&
            deadline.day == prevDeadline.day;
  }
}
