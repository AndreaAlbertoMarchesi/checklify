import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/NotesInput.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesComponent extends StatelessWidget {
  NotesComponent(this.taskValues,this.isAdding);

  final TaskValues taskValues;
  final bool isAdding;


  @override
  Widget build(BuildContext context) {
    final _notesFormKey = GlobalKey<FormState>();
    final settings = context.watch<Settings>();

    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 6, 6),
              child: Text(
                "Notes",
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
              child: Form(
                key: _notesFormKey,
                child: NotesInput(taskValues, isAdding),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
