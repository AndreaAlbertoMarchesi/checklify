import 'package:checklist_app/models/supportClasses/SearchedTask.dart';
import 'package:checklist_app/models/supportClasses/TaskPath.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  String selectedResult;
  List<String> titles = [];

  //List<String> recentList = [];

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

    return Container(
      child: Center(
        child: Text(
          selectedResult,
          style: TextStyle(
            fontSize: settings.getFontSizeChildren(),
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: settings.getFont(),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    List<SearchedTask> searchedTasks;

    //if (query.isEmpty)
    //suggestionList = recentList;
    //else
    {
      TaskPath taskPath = appState.taskPath.getCopy();
      taskPath.backToPrevious();
      searchedTasks = appState.task.searchTasks(query, taskPath);
    }
    return ListView.builder(
        itemCount: searchedTasks.length,
        itemBuilder: (context, index) {
          SearchedTask searchedTask = searchedTasks[index];
          return ListTile(
            title: Text(
              searchedTask.task.title,
              style: TextStyle(
                fontSize: settings.getFontSizeChildren(),
                letterSpacing: 0.6,
                fontWeight: FontWeight.bold,
                color: settings.getFont(),
              ),
            ),
            subtitle: Text(
              searchedTask.taskPath.toString(),
              style: TextStyle(
                fontSize: settings.getFontSizeChildren() - 4,
                letterSpacing: 0.6,
                fontWeight: FontWeight.bold,
                color: settings.getFont(),
              ),
            ),
            onTap: () {
              appState.openTask(searchedTask.task, searchedTask.taskPath);
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final settings = context.watch<Settings>();
    return settings.themeData(context);
  }
}
