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

class TimelineTask extends StatelessWidget {
  TimelineTask(this.taskWithPath, this.hasSameDateAsPrevious);

  final TaskWithPath taskWithPath;
  final bool hasSameDateAsPrevious;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();
    final task = taskWithPath.task;
    final taskPath = taskWithPath.taskPath;

    return ListTile(
      leading: hasSameDateAsPrevious
          ? Container(
              width: 40,
              height: 40,
            )
          : Text(task.deadline.day.toString()),
      title: Text(task.title),
      subtitle: Text(taskPath.toString()),
      trailing: Text((task.percentage * 100).round().toString()),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        appState.openTask(task, taskPath);
      },
    );
  }
}
