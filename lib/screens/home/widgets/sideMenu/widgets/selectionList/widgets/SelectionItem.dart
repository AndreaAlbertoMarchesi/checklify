import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionItem extends StatelessWidget {
  SelectionItem(this.taskWithPath);

  final TaskWithPath taskWithPath;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();
    final task = taskWithPath.task;
    final taskPath = taskWithPath.taskPath;
    return ListTile(
      title: AppTextDecoration(task.title,
          fontSize: settings.getFontSizeChildren(),
          fontWeight: FontWeight.bold,
          color: settings.getFont()),
      subtitle: AppTextDecoration(taskPath.toString(),
          fontSize: settings.getFontSizeChildren() - 4,
          fontWeight: FontWeight.bold,
          color: settings.getFont()),
      trailing: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => appState.deselect(task),
      ),
    );
  }
}
