import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogTitle.dart';
import 'file:///C:/Users/aam63/StudioProjects/checklify/lib/sharedWidgets/alertDialogWidgets/DialogButton.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageCounterDialog extends StatefulWidget {
  PercentageCounterDialog(this.task);

  final Task task;

  @override
  _PercentageCounterDialogState createState() =>
      _PercentageCounterDialogState();
}

class _PercentageCounterDialogState extends State<PercentageCounterDialog> {
  int completionCount;

  @override
  void initState() {
    super.initState();
    completionCount = (widget.task.percentage * widget.task.counterMax).round();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Set progress"),
      content: Row(children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (completionCount < widget.task.counterMax) completionCount++;
            });
          },
          icon: Icon(Icons.keyboard_arrow_up),
        ),
        Expanded(
          child: Text(
            completionCount.toString() +
                "/" +
                widget.task.counterMax.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (completionCount > 0) completionCount--;
            });
          },
          icon: Icon(Icons.keyboard_arrow_down),
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
            appState.updatePercentage(
                widget.task, completionCount / widget.task.counterMax);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
