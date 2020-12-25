import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/progressTypeInput/widgets/counterSetter/widgets/CounterSetterDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterSetter extends StatelessWidget {
  CounterSetter(this.taskValues, this.refreshModifyTask);

  final Function refreshModifyTask;
  final TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: IconButton(
            onPressed: () {
              if (taskValues.counterMax == null) {
                taskValues.counterMax = 1;
                refreshModifyTask();
              }
              showDialog(
                context: context,
                builder: (context) =>
                    CounterSetterDialog(refreshModifyTask, taskValues),
              );
            },
            icon: Icon(Icons.format_list_numbered_rtl),
          ),
        ),
        Text(taskValues.counterMax == null
            ? 1.toString()
            : taskValues.counterMax.toString()),
      ],
    );
  }
}
