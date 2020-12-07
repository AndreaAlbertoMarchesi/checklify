import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/selectionList/widgets/SelectionListTile.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/SelectionItem.dart';

class SelectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return Expanded(
      child: Column(children: [
        SelectionListTile(),
        Expanded(
          child: ListView(
            children: appState
                .getSelectedTaskWithPaths()
                .map((task) => SelectionItem(task))
                .toList(),
          ),
        ),
      ]),
    );
  }
}
