import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/screens/timeline/widgets/widgets/PercentageWidget.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(9, 0, 3, 0),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Color(task.colorValue),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: settings.getHighlightedColor(task.colorValue),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: ListTile(
          title: AppTextDecoration(task.title,
              fontSize: settings.getFontSizeChildren(),
              color: settings.getFontTiles()),
          subtitle: AppTextDecoration(taskPath.toString(),
              color: settings.getFontTiles()),
          trailing: PercentageWidget(task),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            appState.openTask(task, taskPath);
          },
        ),
      ),
    );
  }
}
