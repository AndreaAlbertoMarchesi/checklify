import 'package:flutter/cupertino.dart';

class NotesText extends StatelessWidget {
  NotesText(this.notes);

  final String notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        notes,
        style: TextStyle(
          letterSpacing: 0.5,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
