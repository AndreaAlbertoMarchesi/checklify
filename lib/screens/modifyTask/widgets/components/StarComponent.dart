import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/StarInput.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StarComponent extends StatelessWidget {
  StarComponent(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 6, 6),
              child: AppTextDecoration("Starred Task",
                  fontSize: settings.getFontSizeChildren(),
                  fontWeight: FontWeight.bold,
                  color: settings.getFont()),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: StarInput(taskValues, refreshModifyTask),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
