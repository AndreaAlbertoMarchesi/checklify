import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/progressTypeInput/ProgressTypeInput.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressTypeComponent extends StatelessWidget {
  ProgressTypeComponent(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 6, 6),
              child: Text(
                "Indicator",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren(),
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  color: settings.getFont(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProgressTypeInput(taskValues, refreshModifyTask),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
