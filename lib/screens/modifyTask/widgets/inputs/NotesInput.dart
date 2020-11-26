import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesInput extends StatelessWidget {
  NotesInput(this.notes, this.isAdding, this.setNotes);

  final String notes;
  final Function setNotes;
  final bool isAdding;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    final TextEditingController _controller = new TextEditingController(
      text: isAdding ? '' : notes,
    );

    return TextFormField(
      controller: _controller,
      maxLines: null,
      maxLength: 100,
      decoration: InputDecoration(
        hintText: isAdding ? "insert additional notes" : notes,
        filled: true,
        contentPadding: EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
        ),
      ),
      validator: (val) => (val.length > 100) ? 'too much text' : null,
      onChanged: (val) {
        setNotes(val);
      },
    );
  }
}
