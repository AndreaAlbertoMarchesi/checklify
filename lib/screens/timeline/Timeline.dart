import 'package:cell_calendar/cell_calendar.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineFreeDays.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineTask.dart';
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
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        extendBody: true,
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: getItems(appState.root),
        ));
  }

  List<Widget> getItems(Task root) {
    List<TaskWithPath> tasksWithPaths = root.getTimelineTasks(TaskPath());
    tasksWithPaths.sort((a, b) => a.task.deadline.compareTo(b.task.deadline));

    List<Widget> items = List<Widget>();
    DateTime previousDeadline;

    tasksWithPaths.forEach((e) {
      DateTime currentDeadline = e.task.deadline;
      bool hasSameDateAsPrevious =
          haveSameDate(currentDeadline, previousDeadline);

      if (previousDeadline != null &&
          currentDeadline.difference(previousDeadline).inDays > 1)
        items.add(TimelineFreeDays(previousDeadline, currentDeadline));

      items.add(TimelineTask(e, hasSameDateAsPrevious));

      previousDeadline = e.task.deadline;
    });
    return items;
  }

  bool haveSameDate(DateTime deadline, DateTime prevDeadline) {
    return prevDeadline == null
        ? false
        : deadline.month == prevDeadline.month &&
            deadline.day == prevDeadline.day;
  }
}
