import 'package:checklist_app/models/supportClasses/TaskPreferences.dart';
import 'package:flutter/material.dart';

import '../Task.dart';

class TaskValues {
  TaskValues({Task task, TaskPreferences taskPreferences}) {
    if (task != null) {
      title = task.title;
      notes = task.notes;
      colorValue = task.colorValue;
      deadline = task.deadline;
      dateTimeNotification =
          task.notification != null ? task.notification.dateTime : null;
      isStarred = task.isStarred;
      progressType = task.progressType;
      percentageDivisions = task.percentageDivisions;
      doesShowDailyPercentage = task.doesShowDailyPercentage;
    }
    if(taskPreferences!=null) {
      percentageDivisions = taskPreferences.percentageDivisions;
      progressType = taskPreferences.progressType;
      colorValue = taskPreferences.colorValue;
      doesShowDailyPercentage = taskPreferences.doesShowDailyPercentage;
    }
  }

  String title = "";
  String notes = "";
  int colorValue = defaultColorValue;
  DateTime deadline;
  DateTime dateTimeNotification;
  bool isStarred = false;
  ProgressType progressType = defaultProgressType;
  int percentageDivisions = defaultPercentageDivisions;
  bool doesShowDailyPercentage = false;

  static const defaultPercentageDivisions = 3;
  static const defaultProgressType = ProgressType.checkbox;
  static final defaultColorValue = Colors.blue[300].value;
}
