import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckboxRow extends StatelessWidget {
  CheckboxRow(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();


    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            task.title,
            style: TextStyle(
              fontSize: Styles.getFontSizeChildren(appState.size),
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: Styles.getFont(darkState.darkTheme),
            ),
          ),
        ),
        Expanded(child: Container()),
        Checkbox(
          activeColor: Colors.greenAccent[700],
          checkColor: Styles.getColor(darkState.darkTheme),
          value: task.percentage == 1,
          onChanged: (bool value) {
            appState.updateTask(task,
                percentage: task.percentage == 0 ? 1 : 0);
          },
        ),
      ],
    );
  }
}
