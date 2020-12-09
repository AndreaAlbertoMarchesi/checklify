import 'dart:developer';

import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:provider/provider.dart';

class ProgressTypeInput extends StatelessWidget {
  ProgressTypeInput(this.taskValues, this.refreshModifyTask);

  final Function refreshModifyTask;
  final TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Row(
      children: [
        DropdownButton<ProgressType>(
          value: taskValues.progressType,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (ProgressType newValue) {
            taskValues.progressType = newValue;
            refreshModifyTask();
          },
          items: <ProgressType>[
            ProgressType.checkbox,
            ProgressType.counter,
            ProgressType.slider
          ].map<DropdownMenuItem<ProgressType>>((ProgressType progressType) {
            return DropdownMenuItem<ProgressType>(
              value: progressType,
              child: Text(progressType.toString()),
            );
          }).toList(),
        ),
        if (taskValues.progressType == ProgressType.counter)
          Counter(
            maxValue: double.maxFinite,
            initialValue:
                taskValues.counterMax == null ? 1 : taskValues.counterMax,
            decimalPlaces: 0,
            onChanged: (num value) {
              taskValues.counterMax = value;
              refreshModifyTask();
            },
            minValue: 1,
          ),
      ],
    );
  }
}
