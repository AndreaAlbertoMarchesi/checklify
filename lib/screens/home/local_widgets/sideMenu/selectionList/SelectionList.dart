import 'package:checklist_app/states/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SelectionItem.dart';

class SelectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return Expanded(
      child: ListView(
        children: appState
            .getSelectedTasks()
            .map((task) => SelectionItem(task))
            .toList(),
      ),
    );
  }
}
