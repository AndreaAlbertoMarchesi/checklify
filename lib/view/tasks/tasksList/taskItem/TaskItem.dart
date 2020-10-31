import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:checklist_app/view/home/dialogs/DeleteDialog.dart';
import 'package:checklist_app/view/home/dialogs/UpdateDialog.dart';
import 'package:flutter/cupertino.dart';
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
    bool isSelected = appState.getSelectedTasks().contains(task);


    Color getColor() {
      if (isSelected) {
        return Colors.lightGreenAccent[100];
      } else {
        return Colors.white;
      }
    }

    return InkWell(
      child: SwipeTo(
        animationDuration: const Duration(milliseconds: 300),
        iconOnLeftSwipe: Icons.delete_outline,
        iconColor: Colors.deepPurple[600],
        iconOnRightSwipe: Icons.article_outlined,
        onRightSwipe: () {
          Vibration.vibrate(duration: 100);
          showDialog(
            context: context,
            child: UpdateDialog(task),
          );
        },
        onLeftSwipe: () {
          Vibration.vibrate(duration: 100);
          showDialog(
            context: context,
            child: DeleteDialog(task),
          );
        },
        child: Card(
          color: getColor(),
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child:
              task.children.isEmpty ? CheckboxRow(task) : PercentageRow(task),
        ),
      ),
      onTap: () {
        if (!isSelected) appState.openTask(task);
      },
      onDoubleTap: () {
        Vibration.vibrate(duration: 100);
        isSelected ? appState.deselect(task) : appState.selectTask(task);
      },
    );
  }
}
