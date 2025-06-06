import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/Validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesInput extends StatelessWidget {
  NotesInput(this.taskValues, this.isAdding);

  final TaskValues taskValues;
  final bool isAdding;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    final TextEditingController _controller = new TextEditingController(
      text: taskValues.notes,
    );

    return TextFormField(
      controller: _controller,
      maxLines: null,
      maxLength: 100,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: isAdding ? "insert additional notes" : taskValues.notes,
        filled: true,
        contentPadding: EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
        ),
      ),
      validator: Validator.validateNotes,
      onChanged: (val) => taskValues.notes = val,
    );
  }
}
