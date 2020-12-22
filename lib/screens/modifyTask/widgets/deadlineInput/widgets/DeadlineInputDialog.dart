import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogButton.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogTitle.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeadlineInputDialog extends StatefulWidget {
  DeadlineInputDialog(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  _DeadlineInputDialogState createState() => _DeadlineInputDialogState();
}

class _DeadlineInputDialogState extends State<DeadlineInputDialog> {
  DateTime deadline;
  bool hasClearedDeadline = false;

  @override
  void initState() {
    super.initState();
    widget.taskValues.deadline == null
        ? deadline = DateTime.now()
        : deadline = widget.taskValues.deadline;
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Deadline"),
      content: deadline == null && hasClearedDeadline == true
          ? InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,6,0,0),
                child: Text(
                    "add a deadline...",
                  style: TextStyle(
                    fontSize: settings.getFontSizeCoffee(),
                    letterSpacing: 0.6,
                    color: settings.getFont(),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  deadline = DateTime.now();
                });
              },
            )
          : Row(children: [
              Expanded(
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: deadline.toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    return true;
                  },
                  onChanged: (val) {
                    deadline = DateTime.parse(val);
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
                    deadline = null;
                    hasClearedDeadline = true;
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
            widget.taskValues.deadline = deadline;
            widget.refreshModifyTask();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
