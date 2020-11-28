import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/CheckboxRow.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/CountdownText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/DailyPercentageText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/DeadlineText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/NotesText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/PercentageRow.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/dialogs/DeleteDialog.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/dialogs/UpdateDialog.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:vibration/vibration.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();
    bool isSelected = appState.getSelectedTasks().contains(task);

    return InkWell(
      child: SwipeTo(
        animationDuration: const Duration(milliseconds: 300),
        iconOnLeftSwipe: Icons.delete_outline,
        iconColor: settings.getFont(),
        iconOnRightSwipe: Icons.create_outlined,
        onRightSwipe: () {
          if (settings.vibrate) Vibration.vibrate(duration: 80);
          showDialog(
            context: context,
            child: UpdateDialog(task),
          );
        },
        onLeftSwipe: () {
          if (settings.vibrate) Vibration.vibrate(duration: 80);
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
                    ? (task.colorValue != null
                        ? settings.getHighlightedColor(task.colorValue)
                        : Colors.lightGreenAccent[100])
                    : (task.colorValue != null
                        ? Color(task.colorValue)
                        : settings.getColor()),
                boxShadow: [
                  BoxShadow(
                      color: settings.getHighlightedColor(task.colorValue),
                      spreadRadius: 2),
                ],
              ),
              // fixed constraints on widgets are probably not ideal cause widgets needs to be resizable

              /*
            constraints: BoxConstraints(
                maxHeight: settings.getTileSizeChildren()),
              */
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      if (task.dateTime != null) DeadlineText(task.dateTime),
                      Expanded(child: Container()),
                      if (task.dateTime != null) CountdownText(task.dateTime),
                    ],
                  ),
                  task.children.isEmpty
                      ? CheckboxRow(task)
                      : PercentageRow(task),

                  if (task.notes.isNotEmpty) NotesText(task.notes),

                  if (task.dateTime != null) DailyPercentageText(task.dateTime, task.percentage),
                ],
              )),
        ),
      ),
      onTap: () {
        if (!isSelected) appState.openTask(task);
      },
      onDoubleTap: () {
        if (settings.vibrate) Vibration.vibrate(duration: 80);
        isSelected ? appState.deselect(task) : appState.selectTask(task);
      },
    );
  }
}
