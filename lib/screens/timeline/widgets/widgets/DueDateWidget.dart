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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Due Date:",
          style: TextStyle(
            fontSize: settings.getFontSizeCoffee(),
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            color: settings.getFontTiles(),
          ),
        ),
        Container(
          height: 37,
          width: 50,
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
                      color: settings.getFontTiles(),
                   ),
                ),
                task.deadline.day == 1
                    ? Text(
                        " st",
                      style: TextStyle(
                        fontSize: settings.getFontSizeCoffee(),
                          letterSpacing: 0.5,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        color: settings.getFontTiles(),
                        ),
                      )
                    : task.deadline.day == 2
                          ? Text(
                              " nd",
                              style: TextStyle(
                                fontSize: settings.getFontSizeCoffee(),
                                letterSpacing: 0.5,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: settings.getFontTiles(),
                                ),
                            )
                          : task.deadline.day == 3
                              ? Text(
                                  " rd",
                                  style: TextStyle(
                                    fontSize: settings.getFontSizeCoffee(),
                                    letterSpacing: 0.5,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: settings.getFontTiles(),
                                  ),
                                )
                              : Text(
                                " th",
                                  style: TextStyle(
                                    fontSize: settings.getFontSizeCoffee(),
                                    letterSpacing: 0.5,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: settings.getFontTiles(),
                                  ),
                                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              color: Colors.white60,
            boxShadow: [
              BoxShadow(
                color: Colors.white60,
                spreadRadius: 0.0,
                offset: Offset(5.0, 5.0),
              ),
            ],
          ),
        ),
      ],
    );
  }


}
