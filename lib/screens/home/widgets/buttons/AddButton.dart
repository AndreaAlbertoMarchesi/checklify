import 'package:animations/animations.dart';
import 'package:checklist_app/screens/modifyTask/ModifyTask.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();
    if (!appState.isSelected()) {
      return Padding(
        //padding: const EdgeInsets.fromLTRB(15,15,15,70 ),
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: 80,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.bottomRight,
                    child: OpenContainer(
                      transitionDuration: Duration(milliseconds: 400),
                      transitionType: ContainerTransitionType.fadeThrough,
                      closedShape: CircleBorder(),
                      closedColor: Colors.transparent,
                      openColor: Colors.transparent,
                      openElevation: 0,
                      closedElevation: 0,
                      openBuilder: (BuildContext context, closedWidget) {
                        return ModifyTask(taskPreferences: settings.getTaskPreferences());
                      },
                      closedBuilder: (BuildContext context, openWidget) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,4.0),
                          child: FloatingActionButton(
                            elevation: 3,
                            onPressed: openWidget,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 2.0,
                                  top: 2.0,
                                  child: Icon(Icons.add, color: Colors.black26),
                                ),
                                Icon(Icons.add)
                              ],
                            ),
                            backgroundColor: Colors.greenAccent[700],
                          ),
                        );
                      },
                    )),
              ],
            )),
      );
    } else {
      return Padding(
        //padding: const EdgeInsets.fromLTRB(15,15,15,60 ),
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: 80,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,4.0),
                    child: FloatingActionButton(
                      elevation: 3,
                      onPressed: appState.moveTask,
                      child: Icon(Icons.drive_file_move),
                      backgroundColor: Colors.greenAccent[700],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,4.0),
                    child: FloatingActionButton(
                      elevation: 3,
                      onPressed: appState.deselect,
                      child: Icon(Icons.undo),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            )),
      );
    }
  }
}
