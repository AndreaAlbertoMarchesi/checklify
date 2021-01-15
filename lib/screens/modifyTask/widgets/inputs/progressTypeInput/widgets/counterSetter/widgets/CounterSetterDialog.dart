import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogButton.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogTitle.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterSetterDialog extends StatefulWidget {
  CounterSetterDialog(this.refreshModifyTask, this.taskValues);

  final Function refreshModifyTask;
  final TaskValues taskValues;

  @override
  _CounterSetterDialogState createState() => _CounterSetterDialogState();
}

class _CounterSetterDialogState extends State<CounterSetterDialog> {
  int counter;

  @override
  void initState() {
    counter = widget.taskValues.percentageDivisions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Set Counter:"),
      content: Row(children: [
        IconButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          icon: Icon(
            Icons.keyboard_arrow_up,
          ),
        ),
        Expanded(
          child: AppTextDecoration(counter.toString(),
              align: TextAlign.center,
              fontSize: settings.getFontSizeChildren(),
              color: settings.getFont()),
        ),
        IconButton(
          onPressed: () {
            if (counter > 1) {
              setState(() {
                counter--;
              });
            }
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
            widget.taskValues.percentageDivisions = counter;
            widget.refreshModifyTask();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
