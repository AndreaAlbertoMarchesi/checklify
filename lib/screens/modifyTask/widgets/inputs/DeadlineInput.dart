import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeadlineInput extends StatelessWidget {
  DeadlineInput(this.setDeadline);
  final setDeadline;
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      dateLabelText: 'Date',
      timeLabelText: "Hour",
      selectableDayPredicate: (date) {
        // Disable weekend days to select from the calendar
        /*if (date.weekday == 6 || date.weekday == 7) {
          return false;
        }*/

        return true;
      },
      onChanged: (val) {
        setDeadline(DateTime.parse(val));
      },
      validator: (val) {
        print(val);
        return null;
      },
      onSaved: (val) => setDeadline(DateTime.parse(val)),
    );
  }
}
