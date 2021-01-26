import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/reminderInput/widgets/ReminderInputDialog.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/DateTimeFormatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

class ReminderInput extends StatelessWidget {
  ReminderInput(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return InkWell(
      child: Container(
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: AppTextDecoration(
                  "Reminder",
                  fontSize: settings.getFontSizeChildren(),
                  color: settings.getFont(),
                ),
              ),
              AppTextDecoration(
                  taskValues.dateTimeNotification != null
                      ? DateTimeFormatter.dateTimeToFullString(
                          taskValues.dateTimeNotification)
                      : "add a reminder...",
                  fontSize: settings.getFontSizeCoffee() - 3,
                  color: settings.getFont()),
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: settings.getColor()),
          ))),
      onTap: () {
        showAnimatedDialog(
          context: context,
          builder: (context) =>
              ReminderInputDialog(taskValues, refreshModifyTask),
          animationType: DialogTransitionType.fade,
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 400),
          barrierDismissible: true,
        );
      },
    );
  }
}
