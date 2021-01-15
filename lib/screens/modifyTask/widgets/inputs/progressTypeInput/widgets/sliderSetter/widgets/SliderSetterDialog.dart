import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogTitle.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class SliderSetterDialog extends StatelessWidget {
  SliderSetterDialog(this.taskValues);

  final TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return NumberPickerDialog.integer(
      title: Center(child: DialogTitle("Slider divisions:")),
      minValue: 1,
      maxValue: 10,
      infiniteLoop: true,
      initialIntegerValue:
          taskValues.percentageDivisions == null ? 3 : taskValues.percentageDivisions,
      cancelWidget: Text(
        "Cancel",
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: settings.getFont(),
        ),
      ),
      confirmWidget: Text(
        "Done",
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: settings.getFont(),
        ),
      ),
    );
  }
}
