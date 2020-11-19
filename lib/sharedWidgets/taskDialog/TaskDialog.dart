import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/buttons/AddConfirmButton.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/buttons/CancelButton.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/buttons/UpdateConfirmButton.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/inputs/ColorPicker.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/inputs/DeadlineInput.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/inputs/NotesInput.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/inputs/TitleInput.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class TaskDialog extends StatefulWidget {
  TaskDialog({this.task});

  final Task task;

  @override
  _TaskDialogState createState() => task == null
      ? _TaskDialogState(
          isAdding: true,
          title: '',
          color: Colors.lightBlue,
          notes: '',
        )
      : _TaskDialogState(
          isAdding: false,
          title: task.title,
          color: Color(task.colorValue),
          notes: task.notes,
        );
}

class _TaskDialogState extends State<TaskDialog> {
  _TaskDialogState({this.isAdding, this.title, this.color, this.notes});

  final bool isAdding;
  String title;
  Color color;
  String notes;

  @override
  Widget build(BuildContext context) {
    final _titleFormKey = GlobalKey<FormState>();
    final _notesFormKey = GlobalKey<FormState>();
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    void addTask() {
      if (_titleFormKey.currentState.validate()) {
        appState.addTask(title, colorValue: color.value, notes: notes);
        Navigator.of(context).pop();
      } else if (settings.vibrate) Vibration.vibrate(duration: 80);
    }

    void updateTask() {
      if (_titleFormKey.currentState.validate()) {
        appState.updateTask(
          widget.task,
          notes: notes,
          title: title,
          colorValue: color.value,
        );
        Navigator.pop(context);
      } else if (settings.vibrate) Vibration.vibrate(duration: 80);
    }

    return AlertDialog(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        scrollable: true,
        title: Text(
            isAdding ? "Add a task" : "Update " + widget.task.title,
          style: TextStyle(
            fontSize: settings.getFontSizeChildren(),
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: settings.getFont(),
          ),
        ),
        content: Container(
          width: 150,
          height: 200,
          child: ListView(children: [
            Form(
                key: _titleFormKey,
                child: TitleInput(title, isAdding, setTitle)),
            ColorPicker(setColor, color),
            Form(
              key: _notesFormKey,
              child: NotesInput(notes, isAdding, setNotes),
            ),
            DeadlineInput(),
          ]),
        ),
        actions: isAdding
            ? [
                CancelButton(),
                AddConfirmButton(addTask),
              ]
            : [
                CancelButton(),
                UpdateConfirmButton(updateTask),
              ]);
  }

  setColor(Color color) {
    this.color = color;
  }

  setNotes(String notes) {
    this.notes = notes;
  }

  setTitle(String title) {
    this.title = title;
  }
}
