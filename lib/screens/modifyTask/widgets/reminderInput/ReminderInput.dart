import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/reminderInput/widgets/ReminderInputDialog.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/DateTimeFormatter.dart';
import 'package:flutter/material.dart';
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
                child: Text(
                  "Reminder",
                  style: TextStyle(
                    fontSize: settings.getFontSizeChildren(),
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.bold,
                    color: settings.getFont(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  taskValues.dateTimeNotification != null
                      ? DateTimeFormatter.dateTimeToFullString(
                          taskValues.dateTimeNotification)
                      : "add a reminder...",
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: settings.getColor()),
          ))),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              ReminderInputDialog(taskValues, refreshModifyTask),
        );
      },
    );
  }
}
