import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesInput extends StatelessWidget {
  NotesInput(this.notes, this.setNotes);

  final String notes;
  final Function setNotes;

  @override
  Widget build(BuildContext context) {
    final darkState = context.watch<DarkThemeState>();

    final TextEditingController _controller = new TextEditingController(
      text: notes,
    );

    return TextFormField(
      controller: _controller,
      maxLines: null,
      maxLength: 100,
      decoration: InputDecoration(
        hintText: notes,
        filled: true,
        contentPadding: EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Styles.getBorder(darkState.darkTheme), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Styles.getBorder(darkState.darkTheme), width: 2.0),
        ),
      ),
      validator: (val) => (val.length > 100) ? 'too much text' : null,
      onChanged: (val) {
        setNotes(val);
      },
    );
  }
}
