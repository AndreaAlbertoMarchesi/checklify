import 'dart:developer';

import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:provider/provider.dart';

class ProgressTypeInput extends StatelessWidget {
  ProgressTypeInput(this.progressType, this.setProgressType, this.counterMax, this.setCounterMax);

  final Function setProgressType;
  final Function setCounterMax;
  final ProgressType progressType;
  final int counterMax;


  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Row(
      children: [
        DropdownButton<ProgressType>(
          value: progressType,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (ProgressType newValue) {
            setProgressType(newValue);
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
        if (progressType == ProgressType.counter)
          Counter(
            maxValue: double.maxFinite,
            initialValue: counterMax == null ? 0 : counterMax,
            decimalPlaces: 0,
            onChanged: (num value) {
              setCounterMax(value);
            },
            minValue: 1,
          ),
      ],
    );
  }
}
