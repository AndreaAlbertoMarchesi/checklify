import 'package:checklist_app/models/supportClasses/TaskWithPath.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/TaskUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  String selectedResult;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.red,
        ),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();
    List<TaskWithPath> searchedTasks;

    TaskPath taskPath = appState.taskPath.getCopy();
    if (taskPath.getLength() > 0) taskPath.backToPrevious();
    searchedTasks = TaskUtils.getTasksByName(query, taskPath, appState.task);

    return ListView.builder(
        itemCount: searchedTasks.length,
        itemBuilder: (context, index) {
          TaskWithPath searchedTask = searchedTasks[index];
          return Container(
            child: ListTile(
              title: AppTextDecoration(searchedTask.task.title,
                  fontSize: settings.getFontSizeChildren(),
                  color: settings.getFont()),
              subtitle: AppTextDecoration(searchedTask.taskPath.toString(),
                  fontSize: settings.getFontSizeChildren() - 4,
                  color: settings.getFont()),
              onTap: () {
                appState.openTask(searchedTask.task, searchedTask.taskPath);
                Navigator.of(context).pop();
              },
            ),
            decoration:
                BoxDecoration(border: Border.all(color: settings.getColor())),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    List<TaskWithPath> searchedTasks;
    TaskPath taskPath = appState.taskPath.getCopy();
    taskPath.backToPrevious();
    searchedTasks = TaskUtils.getTasksByName(query, taskPath, appState.task);

    return ListView.builder(
        itemCount: searchedTasks.length,
        itemBuilder: (context, index) {
          TaskWithPath searchedTask = searchedTasks[index];
          return Container(
            child: ListTile(
              title: AppTextDecoration(searchedTask.task.title,
                  fontSize: settings.getFontSizeChildren(),
                  color: settings.getFont()),
              subtitle: AppTextDecoration(searchedTask.taskPath.toString(),
                  fontSize: settings.getFontSizeChildren() - 4,
                  color: settings.getFont()),
              onTap: () {
                appState.openTask(searchedTask.task, searchedTask.taskPath);
                Navigator.of(context).pop();
              },
            ),
            decoration:
                BoxDecoration(border: Border.all(color: settings.getColor())),
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final settings = context.watch<Settings>();
    return settings.themeData(context);
  }
}
