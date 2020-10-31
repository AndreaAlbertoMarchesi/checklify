import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/supportClasses/TaskPath.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialogs/AddDialog.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    if (appState.getSelectedTasks().isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 80,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {


                      //   SEARCH   DEMO
                      // you call the search task function on the task where you start searching for tasks
                      // you pass as parameter the title and the task path of the starting task, root in this case
                      // you get a list of searched tasks that have title and taskPath attributes
                      // the taskPath is needed both to open the searched task and to avoid ambiguity among titles
                      print("SEARCH DEMO");
                      appState.root.searchTasks("title", TaskPath()).forEach((element) {
                        print(element.title+"  task path:  "+ element.taskPath.toString());
                      });

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
        padding: const EdgeInsets.all(8.0),
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