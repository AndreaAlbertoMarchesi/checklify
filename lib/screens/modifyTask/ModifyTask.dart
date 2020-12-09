import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/buttons/CancelButton.dart';
import 'package:checklist_app/screens/modifyTask/widgets/buttons/ConfirmButton.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/ColorPicker.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/DateTimeNotificationInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/DeadlineInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/NotesInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/ProgressTypeInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/StarInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/TitleInput.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class ModifyTask extends StatefulWidget {
  ModifyTask({this.task});

  final Task task;

  @override
  _ModifyTaskState createState() => task == null
      ? _ModifyTaskState(
          isAdding: true,
          taskValues: TaskValues(),
        )
      : _ModifyTaskState(
          isAdding: false,
          taskValues: TaskValues(task),
        );
}

class _ModifyTaskState extends State<ModifyTask> {
  _ModifyTaskState({this.isAdding, this.taskValues});

  final bool isAdding;
  TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    final _titleFormKey = GlobalKey<FormState>();
    final _notesFormKey = GlobalKey<FormState>();
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    void addTask() {
      if (_titleFormKey.currentState.validate()) {
        appState.addTask(taskValues);
        Navigator.of(context).pop();
      } else if (settings.vibrate) Vibration.vibrate(duration: 80);
    }

    void updateTask() {
      if (_titleFormKey.currentState.validate()) {
        appState.updateTask(widget.task, taskValues);
        Navigator.pop(context);
      } else if (settings.vibrate) Vibration.vibrate(duration: 80);
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      appBar: AppBar(
        leading: CancelButton(),
        actions: <Widget>[ConfirmButton(isAdding ? addTask : updateTask)],
        title: Text(
          isAdding ? "Add a task" : "Update " + widget.task.title,
          style: TextStyle(
            fontSize: settings.getFontSizeChildren(),
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: settings.getAppBarIcon(),
          ),
        ),
      ),
      body: ListView(children: [
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 6, 6),
                  child: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: settings.getFontSizeChildren(),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: settings.getFont(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _titleFormKey,
                      child: TitleInput(taskValues, isAdding)),
                ),
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: settings.getColor()),
              bottom: BorderSide(color: settings.getColor()),
            ))),
        Container(
            child: ColorPicker(taskValues),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: settings.getColor()),
            ))),
        Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 15, 6, 6),
                  child: Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: settings.getFontSizeChildren(),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: settings.getFont(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _notesFormKey,
                    child: NotesInput(taskValues, isAdding),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: settings.getColor()),
            ))),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 15, 6, 6),
          child: Text(
            "Due Date",
            style: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: settings.getFont(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DeadlineInput(taskValues, refreshModifyTask),
        ),
        StarInput(taskValues, refreshModifyTask),
        ProgressTypeInput(taskValues, refreshModifyTask),
        if (taskValues.deadline != null)
          DateTimeNotificationInput(taskValues, refreshModifyTask),
      ]),
    );
  }
  refreshModifyTask() => setState(() {});
}
