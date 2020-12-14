import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/CountdownText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/DailyPercentageText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/DeadlineText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/NotesText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/percentageRow/PercentageRow.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/percentageRow/widgets/NotificationIcon.dart';
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
    bool isSelected = appState.isSelected(task);

    return InkWell(
      child: SwipeTo(
        animationDuration: const Duration(milliseconds: 200),
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
          margin: EdgeInsets.fromLTRB(13, 5, 13, 5),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      if (task.deadline != null) DeadlineText(task.deadline),
                      Expanded(child: Container()),
                      if (task.notification != null &&
                          task.notification.dateTime.isAfter(DateTime.now()))
                        NotificationIcon(),
                      if (task.deadline != null) CountdownText(task.deadline,task.percentage),
                    ],
                  ),
                  PercentageRow(task),

                  if (task.notes.isNotEmpty) NotesText(task.notes),

                  if (task.deadline != null) DailyPercentageText(task.deadline, task.percentage),
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
