import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckboxRow extends StatelessWidget {
  CheckboxRow(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            task.title,
            style: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles(),
            ),
          ),
        ),
        Expanded(child: Container()),
        task.isStarred ?
              IconButton(
                  icon: Icon(Icons.star, color: Colors.yellowAccent),
                onPressed: (){
                    appState.setStarredTask(task, false);
                },
              )
            : IconButton(
                  icon: Icon(Icons.star_border, color: Colors.yellowAccent),
                onPressed:(){
                  appState.setStarredTask(task, true);
                } ,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 6, 6, 6),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: settings.getHighlightedColor(task.colorValue),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
            child: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                activeColor: Colors.greenAccent[700],
                checkColor: settings.getFontTiles(),
                value: task.percentage == 1,
                onChanged: (bool value) {
                  appState.updateTask(task,
                      percentage: task.percentage == 0 ? 1 : 0);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
