import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DeleteDialog extends StatelessWidget {
  DeleteDialog(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();

    return AlertDialog(
      title: Text(
          "Item Selected",
        style: TextStyle(
          fontSize: Styles.getFontSizeChildren(appState.size),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: Styles.getFont(darkState.darkTheme),
        ),
      ),
      content: Text(
          "Do you want to delete it?",
        style: TextStyle(
          fontSize: Styles.getFontSizeChildren(appState.size),
          letterSpacing: 0.6,
          color: Styles.getFont(darkState.darkTheme),
        ),),
      actions: [
        FlatButton(
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: Styles.getFont(darkState.darkTheme),
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
              fontSize: 16,
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: Styles.getFont(darkState.darkTheme),
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