import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoesShowDailyPercentageInput extends StatelessWidget {
  DoesShowDailyPercentageInput(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text("show daily percentage"),
        value: taskValues.doesShowDailyPercentage != null
            ? taskValues.doesShowDailyPercentage
            : false,
        onChanged: (value) {
          taskValues.doesShowDailyPercentage = value;
          refreshModifyTask();
        });
  }
}
