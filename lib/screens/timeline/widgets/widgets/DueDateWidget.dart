import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DueDateWidget extends StatelessWidget {

  DueDateWidget(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return
        /*Text(
            "Due Date:",
          style: TextStyle(
            fontSize: settings.getFontSizeCoffee(),
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: settings.getFontTiles(),
          ),
        ),*/
        Container(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    task.deadline.day.toString(),
                    style: TextStyle(
                      fontSize: settings.getFontSizeCoffee(),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      color: settings.getFont(),
                   ),
                ),
                task.deadline.day == 1
                    ? Text(
                        "st",
                      style: TextStyle(
                        fontSize: settings.getFontSizeCoffee()-4,
                          letterSpacing: 0.5,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        color: settings.getFont(),
                        ),
                      )
                    : task.deadline.day == 2
                          ? Text(
                              "nd",
                              style: TextStyle(
                                fontSize: settings.getFontSizeCoffee()-4,
                                letterSpacing: 0.5,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: settings.getFont(),
                                ),
                            )
                          : task.deadline.day == 3
                              ? Text(
                                  "rd",
                                  style: TextStyle(
                                    fontSize: settings.getFontSizeCoffee()-4,
                                    letterSpacing: 0.5,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: settings.getFont(),
                                  ),
                                )
                              : Text(
                                "th",
                                  style: TextStyle(
                                    fontSize: settings.getFontSizeCoffee()-4,
                                    letterSpacing: 0.5,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: settings.getFont(),
                                  ),
                                ),
              ],
            ),
          ),
        );
  }


}
