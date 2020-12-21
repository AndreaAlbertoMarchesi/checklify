import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogButton.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogTitle.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderInputDialog extends StatefulWidget {
  ReminderInputDialog(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  _ReminderInputDialogState createState() => _ReminderInputDialogState();
}

class _ReminderInputDialogState extends State<ReminderInputDialog> {
  DateTime dateTimeReminder;
  bool hasClearedReminder = false;

  @override
  void initState() {
    super.initState();
    widget.taskValues.dateTimeNotification == null
        ? dateTimeReminder = DateTime.now()
        : dateTimeReminder = widget.taskValues.dateTimeNotification;
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Reminder"),
      content: dateTimeReminder == null && hasClearedReminder == true
          ? InkWell(
              child: Text("add a reminder..."),
              onTap: () {
                setState(() {
                  dateTimeReminder = DateTime.now();
                });
              },
            )
          : Row(children: [
              Expanded(
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: dateTimeReminder.toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    return true;
                  },
                  onChanged: (val) {
                    dateTimeReminder = DateTime.parse(val);
                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    dateTimeReminder = null;
                    hasClearedReminder = true;
                  });
                },
                icon: Icon(Icons.clear),
              )
            ]),
      actions: [
        DialogButton(
          context: context,
          text: "Cancel",
          onPressed: () => Navigator.of(context).pop(),
        ),
        DialogButton(
          context: context,
          text: "Done",
          onPressed: () {
            widget.taskValues.dateTimeNotification = dateTimeReminder;
            widget.refreshModifyTask();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
