import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/view/home/sideMenu/selectionList/SelectionItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
