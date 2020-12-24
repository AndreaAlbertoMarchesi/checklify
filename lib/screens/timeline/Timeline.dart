import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/screens/timeline/InAppCalendar/InAppCalendar.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineFreeDays.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineTask.dart';
import 'package:checklist_app/screens/timeline/widgets/timeLineStructure/TimeLineStructure.dart';
import 'package:checklist_app/screens/timeline/widgets/widgets/dueDateWidget/DueDateWidget.dart';
import 'package:checklist_app/screens/timeline/widgets/widgets/MonthWidget.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();

    List<Widget> getItems(Task root) {
      List<TaskWithPath> tasksWithPaths = root.getTimelineTasks(TaskPath());
      tasksWithPaths.sort((a, b) => a.task.deadline.compareTo(b.task.deadline));

      List<Widget> items = List<Widget>();
      DateTime previousDeadline;

      if (tasksWithPaths.isNotEmpty) {
        items.add(MonthWidget(
            null, tasksWithPaths.first.task.deadline, settings.getMonth));
      }
      tasksWithPaths.forEach((e) {
        DateTime currentDeadline = e.task.deadline;
        bool hasSameDateAsPrevious =
            haveSameDate(currentDeadline, previousDeadline);

        if (previousDeadline != null &&
            currentDeadline.difference(previousDeadline).inDays > 1) {
          items.add(TimelineFreeDays(previousDeadline, currentDeadline));
        }
        items.add(TimelineTask(e, hasSameDateAsPrevious));

        previousDeadline = e.task.deadline;
      });
      return items;
    }

    List<Widget> getIndicator(Task root) {
      List<TaskWithPath> tasksWithPaths = root.getTimelineTasks(TaskPath());
      tasksWithPaths.sort((a, b) => a.task.deadline.compareTo(b.task.deadline));
      List<Widget> items = List<Widget>();
      DateTime previousDeadline;

      if (tasksWithPaths.isNotEmpty) {
        items.add(Icon(
          Icons.calendar_today_outlined,
          color: settings.getFont(),
        ));
      }

      tasksWithPaths.forEach((element) {
        DateTime currentDeadline = element.task.deadline;
        bool hasSameDateAsPrevious =
            haveSameDate(currentDeadline, previousDeadline);

        if (previousDeadline != null &&
            currentDeadline.difference(previousDeadline).inDays > 1) {
          items.add(Icon(
            Icons.swap_vertical_circle,
            color: settings.getFont(),
          ));
        }

        if (hasSameDateAsPrevious) {
          items.add(Icon(
            Icons.fiber_manual_record_outlined,
            color: settings.getFont(),
          ));
        } else {
          items.add(DueDateWidget(element.task));
        }
        previousDeadline = element.task.deadline;
      });
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
                List<TaskWithPath> tasksWithPaths =
                    appState.root.getTimelineTasks(TaskPath());
                tasksWithPaths
                    .sort((a, b) => a.task.deadline.compareTo(b.task.deadline));
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
