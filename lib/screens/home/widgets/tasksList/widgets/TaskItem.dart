import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/DailyPercentageText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/NotesText.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/PercentageRow.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/topRow/TopRow.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                TopRow(task),
                PercentageRow(task),
                if (task.notes.isNotEmpty) NotesText(task.notes),
                if (task.doesShowDailyPercentage != null &&
                    task.doesShowDailyPercentage &&
                    task.deadline != null &&
                    !task.isCompleted())
                  DailyPercentageText(task.deadline, task.percentage),
              ],
            )),
      ),
      /*SwipeTo(
        animationDuration: const Duration(milliseconds: 200),
        iconOnLeftSwipe: Icons.delete_outline,
        iconColor: settings.getFont(),
        iconOnRightSwipe: Icons.create_outlined,
        onRightSwipe: () {
          if (settings.vibrate) Vibration.vibrate(duration: 80);
          showDialog(
            context: context,
            child: ModifyTask(task: task),
          );
        },
        onLeftSwipe: () {
          if (settings.vibrate) Vibration.vibrate(duration: 80);
          showAnimatedDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => DeleteDialog(task),
            animationType: DialogTransitionType.fade,
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 400),
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
                  TopRow(task),
                  PercentageRow(task),
                  if (task.notes.isNotEmpty) NotesText(task.notes),

                  if (task.deadline != null && !task.isCompleted()) DailyPercentageText(task.deadline, task.percentage),
                ],
              )),
        ),
      ),*/
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
