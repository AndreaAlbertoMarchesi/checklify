import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/TaskDialog.dart';
import 'package:flutter/material.dart';

class UpdateDialog extends StatelessWidget {
  UpdateDialog(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return TaskDialog(task: task);
  }
}
