import 'package:checklist_app/screens/home/widgets/tasksList/widgets/TaskItem.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/dialogs/DeleteDialog.dart';
import 'package:checklist_app/screens/modifyTask/ModifyTask.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Expanded(
        child: ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        appState.handleReorder(oldIndex, newIndex, false);
      },
      children: appState.task.children.map((task) {
        return Slidable(
            key: PageStorageKey(task),
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.2,
            actions: [
              //left
              IconSlideAction(
                icon: Icons.create_outlined,
                foregroundColor: settings.getFont(),
                color: Colors.transparent,
                caption: "Modify",
                onTap: (){
                  showAnimatedDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) => ModifyTask(task: task),
                    animationType: DialogTransitionType.fade,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 400),
                  );
                },
              ),
            ],
            secondaryActions: [
              //right
              IconSlideAction(
                icon: Icons.delete_outline,
                foregroundColor: Colors.red[800],
                color: Colors.transparent,
                caption: "Delete",
                onTap: (){
                  showAnimatedDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) => DeleteDialog(task),
                    animationType: DialogTransitionType.fade,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 400),
                  );
                },
              )
            ],
            child: Container(child: TaskItem(task)));
      }).toList(),
    ));
  }
}
