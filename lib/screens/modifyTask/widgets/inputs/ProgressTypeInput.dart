import 'dart:developer';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class ProgressTypeInput extends StatelessWidget {
  ProgressTypeInput(this.taskValues, this.refreshModifyTask);

  final Function refreshModifyTask;
  final TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    _getTypeName(ProgressType type) {
      switch (type) {
        case ProgressType.checkbox:
          return Text("CheckBox");
          break;
        case ProgressType.counter:
          return Text("Counter");
          break;
        case ProgressType.slider:
          return Text("Slider");
          break;
      }
    }

    Future _showIntDialog() async {
      await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 1,
            maxValue: 10,
            initialIntegerValue:
                taskValues.sliderDivisions == null ? 3 : taskValues.sliderDivisions,
          );
        },
      ).then((num value) {
        if (value != null) {
          taskValues.sliderDivisions = value;
          refreshModifyTask();
        }
      });
    }

    return Row(
      children: [
        DropdownButton<ProgressType>(
          value: taskValues.progressType,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            fontSize: settings.getFontSizeChildren(),
            letterSpacing: 0.6,
            color: settings.getFont(),
          ),
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
              child: _getTypeName(progressType),
            );
          }).toList(),
        ),
        if (taskValues.progressType == ProgressType.counter)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Counter(
              maxValue: double.maxFinite,
              initialValue:
                  taskValues.counterMax == null ? taskValues.counterMax=1 : taskValues.counterMax,
              decimalPlaces: 0,
              onChanged: (num value) {
                taskValues.counterMax = value;
                refreshModifyTask();
              },
              minValue: 1,
            ),
          ),
        if (taskValues.progressType == ProgressType.slider)
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
            child: IconButton(
              onPressed: () => _showIntDialog(),
              icon: Icon(Icons.format_list_numbered_rtl),
            ),
          ),
      ],
    );
  }
}
