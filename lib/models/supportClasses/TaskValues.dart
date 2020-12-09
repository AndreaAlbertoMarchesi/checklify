import 'package:flutter/material.dart';

import '../Task.dart';

class TaskValues {
  TaskValues([Task task]) {
    if (task != null) {
      title = task.title;
      notes = task.notes;
      colorValue = task.colorValue;
      deadline = task.deadline;
      dateTimeNotification =
          task.notification != null ? task.notification.dateTime : null;
      isStarred = task.isStarred;
      progressType = task.progressType;
      counterMax = task.counterMax;
    }
  }

  String title = "";
  String notes = "";
  int colorValue = Colors.blue[300].value;
  DateTime deadline;
  DateTime dateTimeNotification;
  bool isStarred = false;
  ProgressType progressType = ProgressType.checkbox;
  int counterMax;
}
