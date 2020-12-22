import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StarInput extends StatelessWidget {
  StarInput(this.taskValues, this.refreshModifyTask);

  final Function refreshModifyTask;
  final TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return IconButton(
      icon: taskValues.isStarred
          ? Stack(
              children: [
                Positioned(
                  left: 2.0,
                  top: 2.0,
                  child: Icon(Icons.star, color: Colors.black45),
                ),
                Icon(Icons.star, color: Colors.yellowAccent)
              ],
            )
          : Icon(Icons.star_border, color: Colors.yellowAccent),
      onPressed: () {
        taskValues.isStarred = !taskValues.isStarred;
        refreshModifyTask();
      },
    );
  }
}
