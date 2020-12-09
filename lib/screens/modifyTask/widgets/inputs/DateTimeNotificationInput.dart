import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeNotificationInput extends StatelessWidget {
  DateTimeNotificationInput(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: taskValues.dateTimeNotification.toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      dateLabelText: 'Date',
      timeLabelText: "Hour",
      selectableDayPredicate: (date) {
        return true;
      },
      onChanged: (val) {
        taskValues.dateTimeNotification = DateTime.parse(val);
        refreshModifyTask();
      },
      validator: (val) {
        print(val);
        return null;
      },
      onSaved: (val) {
        taskValues.dateTimeNotification = DateTime.parse(val);
        refreshModifyTask();
      },
    );
  }
}
