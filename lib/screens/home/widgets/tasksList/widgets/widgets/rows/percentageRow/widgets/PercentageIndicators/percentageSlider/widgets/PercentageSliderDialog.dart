import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogTitle.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/aam63/StudioProjects/checklify/lib/sharedWidgets/alertDialogWidgets/DialogButton.dart';

class PercentageSliderDialog extends StatefulWidget {
  PercentageSliderDialog(this.task);

  final Task task;

  @override
  _PercentageSliderDialogState createState() => _PercentageSliderDialogState();
}

class _PercentageSliderDialogState extends State<PercentageSliderDialog> {
  double percentage;

  @override
  void initState() {
    super.initState();
    percentage = widget.task.percentage.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Set progress"),
      content: Container(
        alignment: Alignment.center,
        height: 75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
          Text((percentage*100).round().toString()+"%"),
          Slider(
            value: percentage,
            divisions: 100,
            onChanged: (double value) {
              setState(() {
                percentage = value;
              });
            },
          ),
        ]),
      ),
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
            appState.updatePercentage(widget.task, percentage);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
