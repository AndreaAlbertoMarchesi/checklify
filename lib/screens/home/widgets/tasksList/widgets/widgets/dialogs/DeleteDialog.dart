import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  DeleteDialog(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      scrollable: true,
      title: AppTextDecoration("Item Selected",
          fontSize: settings.getFontSizeChildren(),
          fontWeight: FontWeight.bold,
          color: settings.getFont()),
      content: AppTextDecoration("Do you want to delete it?",
          fontSize: settings.getFontSizeChildren(),
          color: settings.getFont(),
          letterSpacing: 0.5),
      actions: [
        FlatButton(
          child: AppTextDecoration("Yes",
              fontSize: settings.getFontSizeChildren(),
              fontWeight: FontWeight.bold,
              color: settings.getFont()),
          onPressed: () {
            appState.deleteTask(task);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: AppTextDecoration("No",
              fontSize: settings.getFontSizeChildren(),
              fontWeight: FontWeight.bold,
              color: settings.getFont()),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
