import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/Task.dart';
import 'package:checklist_app/view/home/dialogs/DeleteDialog.dart';
import 'package:checklist_app/view/home/dialogs/UpdateDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
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
    return InkWell(
      child: SwipeTo(
        animationDuration: const Duration(milliseconds: 300),
        iconOnLeftSwipe: Icons.delete_outline,
        iconOnRightSwipe: Icons.article_outlined,
        onRightSwipe: () => showDialog(
          context: context,
          child: UpdateDialog(task),
        ),
        onLeftSwipe: () => showDialog(
          context: context,
          child: DeleteDialog(task),
        ),
        child: Card(
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
        isSelected ? appState.deselect(task) : appState.selectTask(task);
      },
    );
  }
}
