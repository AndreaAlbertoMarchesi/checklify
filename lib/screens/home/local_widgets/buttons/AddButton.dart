import 'package:checklist_app/states/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialogs/AddDialog.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    if (appState.getSelectedTasks().isEmpty) {
      return Padding(
        //padding: const EdgeInsets.fromLTRB(15,15,15,70 ),
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: 80,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      openAddDialog(context);
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.greenAccent[700],
                  ),
                ),
              ],
            )
        ),
      );
    }else{
      return Padding(
        //padding: const EdgeInsets.fromLTRB(15,15,15,60 ),
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: 80,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: appState.moveTask,
                    child: Icon(Icons.drive_file_move),
                    backgroundColor: Colors.greenAccent[700],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: appState.deselect,
                    child: Icon(Icons.undo),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            )
        ),
      );
    }
  }

  void openAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddDialog();
      },
    );
  }
}