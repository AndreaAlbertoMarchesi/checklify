import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/DialogButton.dart';
import 'package:checklist_app/sharedWidgets/taskDialog/widgets/ColorPicker.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class TaskDialog extends StatefulWidget {
  TaskDialog({this.task});

  final Task task;

  @override
  _TaskDialogState createState() => _TaskDialogState(task);
}

class _TaskDialogState extends State<TaskDialog> {
  _TaskDialogState(this.task);

  final Task task;
  String taskName;
  Color selectedColor;

  @override
  void initState() {
    super.initState();
    taskName = task == null ? '' : task.title;
    selectedColor =
        selectedColor == null ? Colors.white : Color(task.colorValue);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();

    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        scrollable: true,
        title: Form(
          key: _formKey,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: task == null ? "add a task" : taskName,
              filled: true,
              contentPadding: EdgeInsets.all(12.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Styles.getBorder(darkState.darkTheme), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Styles.getBorder(darkState.darkTheme), width: 2.0),
              ),
            ),
            validator: (val) => (val.isEmpty | (val.length > 15))
                ? 'Enter a valid name ( not too long )'
                : null,
            onChanged: (val) {
              taskName = val;
            },
          ),
        ),
        content: Container(

          width: 100,
          height: 100,
          child: ListView(children: [
            ColorPicker(setColorValue, selectedColor),

          ]),
        ),
        actions: task == null
            ? [
                DialogButton(
                  context: context,
                  onPressed: () => Navigator.pop(context),
                  text: 'cancel',
                ),
                DialogButton(
                  context: context,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      appState.addTask(taskName,
                          colorValue: selectedColor.value);
                      Navigator.of(context).pop();
                    } else {
                      if (appState.appUser.vibrate)
                        Vibration.vibrate(duration: 80);
                    }
                  },
                  text: 'add',
                ),
              ]
            : [
                DialogButton(
                  context: context,
                  onPressed: () => Navigator.pop(context),
                  text: 'cancel',
                ),
                DialogButton(
                  context: context,
                  onPressed: () {
                    appState.updateTask(task,
                        title: taskName, colorValue: selectedColor.value);
                    Navigator.pop(context);
                  },
                  text: 'update',
                ),
              ]);
  }

  setColorValue(Color color) {
    setState(() {
      selectedColor = color;
    });
  }
}
