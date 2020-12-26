import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/progressTypeInput/widgets/counterSetter/CounterSetter.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/progressTypeInput/widgets/sliderSetter/SliderSetter.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
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
          CounterSetter(taskValues, refreshModifyTask),
        if (taskValues.progressType == ProgressType.slider)
          SliderSetter(taskValues, refreshModifyTask),
      ],
    );
  }
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
}
