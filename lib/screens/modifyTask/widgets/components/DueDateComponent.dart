import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/DeadlineInput.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DueDateComponent extends StatelessWidget {

  DueDateComponent(this.taskValues,this.refreshModifyTask );
  final TaskValues taskValues;
  final Function refreshModifyTask;
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 6, 6),
              child: Text(
                "Due Date",
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
              child: DeadlineInput(taskValues, refreshModifyTask),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: settings.getColor()),
            ))
    );
  }
}
