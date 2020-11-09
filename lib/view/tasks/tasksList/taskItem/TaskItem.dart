import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:checklist_app/view/home/dialogs/DeleteDialog.dart';
import 'package:checklist_app/view/home/dialogs/UpdateDialog.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:vibration/vibration.dart';
import 'CheckboxRow.dart';
import 'PercentageRow.dart';
import 'package:provider/provider.dart';

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
          if(appState.appUser.vibrate)
            Vibration.vibrate(duration: 80);
          showDialog(
            context: context,
            child: UpdateDialog(task),
          );
        },
        onLeftSwipe: () {
          if(appState.appUser.vibrate)
            Vibration.vibrate(duration: 80);
          showDialog(
            context: context,
            child: DeleteDialog(task),
          );
        },
        child: Card(
          elevation: 0,
          color: isSelected ? Colors.lightGreenAccent[100] : Colors.white,
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child:
              task.children.isEmpty ? CheckboxRow(task) : PercentageRow(task),
        ),
      ),
      onTap: () {
        if (!isSelected) appState.openTask(task);
      },
      onDoubleTap: () {
        if(appState.appUser.vibrate)
          Vibration.vibrate(duration: 80);
        isSelected ? appState.deselect(task) : appState.selectTask(task);
      },
    );
  }
}
