import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/deadlineInput/widgets/DeadlineInputDialog.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/DateTimeFormatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeadlineInput extends StatelessWidget {
  DeadlineInput(this.taskValues, this.refreshModifyTask);

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
                child: AppTextDecoration("Due Date",
                    fontSize: settings.getFontSizeChildren(),
                    fontWeight: FontWeight.bold,
                    color: settings.getFont()),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: AppTextDecoration(
                      taskValues.deadline != null
                          ? DateTimeFormatter.dateTimeToFullString(
                              taskValues.deadline)
                          : "add deadline...",
                      fontSize: settings.getFontSizeCoffee() - 4,
                      color: settings.getFont())),
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
              DeadlineInputDialog(taskValues, refreshModifyTask),
        );
      },
    );
  }
}
