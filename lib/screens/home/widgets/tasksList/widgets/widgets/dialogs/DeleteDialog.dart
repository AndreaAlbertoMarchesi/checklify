import 'package:checklist_app/models/Task.dart';
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
      title: Text(
        "Item Selected",
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: settings.getFont(),
        ),
      ),
      content: Text(
        "Do you want to delete it?",
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
          letterSpacing: 0.6,
          color: settings.getFont(),
        ),
      ),
      actions: [
        FlatButton(
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: settings.getFont(),
            ),
          ),
          onPressed: () {
            appState.deleteTask(task);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            "No",
            style: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: settings.getFont(),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
