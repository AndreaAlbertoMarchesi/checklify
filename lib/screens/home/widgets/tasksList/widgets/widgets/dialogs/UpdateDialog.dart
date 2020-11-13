import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/TaskDialog.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';

class UpdateDialog extends StatelessWidget {
  UpdateDialog(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return TaskDialog(task: task);
  }
}
