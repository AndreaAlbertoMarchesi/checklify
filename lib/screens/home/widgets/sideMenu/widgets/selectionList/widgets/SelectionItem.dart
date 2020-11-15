import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionItem extends StatelessWidget {
  SelectionItem(this.task);
  final Task task;
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();
    return ListTile(
      title: Text(
          task.title,
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => appState.deselect(task),
      ),
    );
  }
}
