import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/modifyTask/widgets/buttons/CancelButton.dart';
import 'package:checklist_app/screens/modifyTask/widgets/buttons/ConfirmButton.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/ColorPicker.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/DeadlineInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/NotesInput.dart';
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
          title: '',
          color: Colors.grey[200],
          notes: '',
        )
      : _ModifyTaskState(
          isAdding: false,
          title: task.title,
          color: Color(task.colorValue),
          notes: task.notes,
        );
}

class _ModifyTaskState extends State<ModifyTask> {
  _ModifyTaskState({this.isAdding, this.title, this.color, this.notes});

  final bool isAdding;
  String title;
  Color color;
  String notes;
  DateTime deadline;

  @override
  Widget build(BuildContext context) {
    final _titleFormKey = GlobalKey<FormState>();
    final _notesFormKey = GlobalKey<FormState>();
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    void addTask() {
      if (_titleFormKey.currentState.validate()) {
        appState.addTask(title,
            colorValue: color.value, notes: notes, dateTime: deadline);
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
          deadline: deadline,
        );
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
            color: settings.getFont(),
          ),
        ),
      ),
      body: ListView(children: [
        Form(key: _titleFormKey, child: TitleInput(title, isAdding, setTitle)),
        ColorPicker(setColor, color),
        Form(
          key: _notesFormKey,
          child: NotesInput(notes, isAdding, setNotes),
        ),
        DeadlineInput(setDeadline),
      ]),
    );
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

  setDeadline(DateTime deadline) {
    print("yo" + deadline.toString());
    this.deadline = deadline;
  }
}
