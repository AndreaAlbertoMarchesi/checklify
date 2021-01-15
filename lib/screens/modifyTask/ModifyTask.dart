import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskPreferences.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/buttons/CancelButton.dart';
import 'package:checklist_app/screens/modifyTask/widgets/buttons/ConfirmButton.dart';
import 'package:checklist_app/screens/modifyTask/widgets/components/ColorPickerComponent.dart';
import 'package:checklist_app/screens/modifyTask/widgets/components/NotesComponent.dart';
import 'package:checklist_app/screens/modifyTask/widgets/components/ProgressTypeComponent.dart';
import 'package:checklist_app/screens/modifyTask/widgets/components/StarComponent.dart';
import 'package:checklist_app/screens/modifyTask/widgets/components/TitleComponent.dart';
import 'package:checklist_app/screens/modifyTask/widgets/deadlineInput/DeadlineInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/reminderInput/ReminderInput.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class ModifyTask extends StatefulWidget {
  ModifyTask({this.task,this.taskPreferences});

  final Task task;
  final taskPreferences;

  @override
  _ModifyTaskState createState() => task == null
      ? _ModifyTaskState(
          isAdding: true,
          taskValues: TaskValues(taskPreferences: taskPreferences),
        )
      : _ModifyTaskState(
          isAdding: false,
          taskValues: TaskValues(task: task),
        );
}

class _ModifyTaskState extends State<ModifyTask> {
  _ModifyTaskState({this.isAdding, this.taskValues});

  final bool isAdding;
  TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    final _titleFormKey = GlobalKey<FormState>();
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    void addTask() {
      if (_titleFormKey.currentState.validate()) {
        appState.addTask(taskValues);
        settings.setTaskPreferences(taskValues);
        Navigator.of(context).pop();
      } else if (settings.vibrate) Vibration.vibrate(duration: 80);
    }

    void updateTask() {
      if (_titleFormKey.currentState.validate()) {
        appState.updateTask(widget.task, taskValues);
        settings.setTaskPreferences(taskValues);
        Navigator.of(context).pop();
      } else if (settings.vibrate) Vibration.vibrate(duration: 80);

    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      appBar: AppBar(
        leading: CancelButton(),
        actions: <Widget>[ConfirmButton(isAdding ? addTask : updateTask)],
        title: AppTextDecoration(
            isAdding ? "Add a task" : "Update " + widget.task.title,
            fontSize: settings.getFontSizeChildren(),
            color: settings.getAppBarIcon()),
      ),
      body: ListView(children: [
        //TITLE
        TitleComponent(taskValues, isAdding, _titleFormKey),

        //COLOR PIKER
        ColorPickerComponent(taskValues),

        //NOTES
        NotesComponent(taskValues, isAdding),
        //DUE DATE
        DeadlineInput(taskValues, refreshModifyTask),

        //STAR
        StarComponent(taskValues, refreshModifyTask),

        //TYPE INDICATOR
        ProgressTypeComponent(taskValues, refreshModifyTask),

        //NOTIFICATION
        ReminderInput(taskValues, refreshModifyTask)
      ]),
    );
  }

  refreshModifyTask() => setState(() {});
}
