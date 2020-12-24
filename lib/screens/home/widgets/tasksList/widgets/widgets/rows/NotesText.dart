import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NotesText extends StatelessWidget {
  NotesText(this.notes);

  final String notes;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: [
          AppTextDecoration("Notes: ",
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: settings.getFontTiles()),
          AppTextDecoration(notes,
              letterSpacing: 0.5,
              fontStyle: FontStyle.italic,
              color: settings.getFontTiles()),
        ],
      ),
    );
  }
}
