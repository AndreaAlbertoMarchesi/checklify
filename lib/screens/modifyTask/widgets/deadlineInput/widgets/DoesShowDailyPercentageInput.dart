import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoesShowDailyPercentageInput extends StatelessWidget {
  DoesShowDailyPercentageInput(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return CheckboxListTile(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: AppTextDecoration("Show daily percentage",
              fontSize: settings.getFontSizeCoffee(),
              color: settings.getFont()),
        ),
        value: taskValues.doesShowDailyPercentage != null
            ? taskValues.doesShowDailyPercentage
            : false,
        onChanged: (value) {
          taskValues.doesShowDailyPercentage = value;
          refreshModifyTask();
        });
  }
}
