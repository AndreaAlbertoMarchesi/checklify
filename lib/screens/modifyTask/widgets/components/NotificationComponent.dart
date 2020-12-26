import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/DateTimeNotificationInput.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationComponent extends StatelessWidget {
  NotificationComponent(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 6, 6),
            child: AppTextDecoration("Notification Date",
                fontSize: settings.getFontSizeChildren(),
                color: settings.getFont()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DateTimeNotificationInput(taskValues, refreshModifyTask),
          ),
        ],
      ),
    );
  }
}
