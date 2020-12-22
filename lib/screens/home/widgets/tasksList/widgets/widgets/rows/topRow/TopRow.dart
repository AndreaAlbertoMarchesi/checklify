import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/topRow/widgets/NotificationIcon.dart';
import 'package:checklist_app/sharedWidgets/CountdownText.dart';
import 'package:checklist_app/sharedWidgets/DeadlineText.dart';
import 'package:flutter/cupertino.dart';

class TopRow extends StatelessWidget {
  TopRow(this.task);

  final Task task;
  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          if (task.deadline != null) DeadlineText(task.deadline),
          Expanded(child: Container()),
          if (task.notification != null &&
              task.notification.dateTime.isAfter(DateTime.now()))
            NotificationIcon(),
          if (task.deadline != null) CountdownText(task.deadline,task.percentage),
        ],
      );
  }
}
