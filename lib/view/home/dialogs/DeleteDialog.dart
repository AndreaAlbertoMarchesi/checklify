import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';


class DeleteDialog extends StatelessWidget {
  DeleteDialog(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return AlertDialog(
      title: Text("Item Selected"),
      content: Text("Do you want to delete it?"),
      actions: [
        FlatButton(
          child: Text("Yes"),
          onPressed: () {
            appState.deleteTask(task);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}