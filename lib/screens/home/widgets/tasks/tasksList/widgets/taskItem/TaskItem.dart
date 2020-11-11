import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasks/tasksList/widgets/taskItem/widgets/dialogs/DeleteDialog.dart';
import 'package:checklist_app/screens/home/widgets/tasks/tasksList/widgets/taskItem/widgets/dialogs/UpdateDialog.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:vibration/vibration.dart';

import 'widgets/CheckboxRow.dart';
import 'widgets/PercentageRow.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();
    bool isSelected = appState.getSelectedTasks().contains(task);

    return InkWell(
      child: SwipeTo(
        animationDuration: const Duration(milliseconds: 300),
        iconOnLeftSwipe: Icons.delete_outline,
        iconColor: Styles.getFont(darkState.darkTheme),
        iconOnRightSwipe: Icons.create_outlined,
        onRightSwipe: () {
          if (appState.appUser.vibrate) Vibration.vibrate(duration: 80);
          showDialog(
            context: context,
            child: UpdateDialog(task),
          );
        },
        onLeftSwipe: () {
          if (appState.appUser.vibrate) Vibration.vibrate(duration: 80);
          showDialog(
            context: context,
            child: DeleteDialog(task),
          );
        },
        child: Card(
          elevation: 0,
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected
                  ? Colors.lightGreenAccent[100]
                  : (task.colorValue != null
                      ? Color(task.colorValue)
                      : Styles.getColor(darkState.darkTheme)),
              boxShadow: [
                BoxShadow(
                    color: Styles.getBorder(darkState.darkTheme),
                    spreadRadius: 2),
              ],
            ),
            constraints: BoxConstraints(
                maxHeight: Styles.getTileSizeChildren(appState.size)),
            child:
                task.children.isEmpty ? CheckboxRow(task) : PercentageRow(task),
          ),
        ),
      ),
      onTap: () {
        if (!isSelected) appState.openTask(task);
      },
      onDoubleTap: () {
        if (appState.appUser.vibrate) Vibration.vibrate(duration: 80);
        isSelected ? appState.deselect(task) : appState.selectTask(task);
      },
    );
  }
}
