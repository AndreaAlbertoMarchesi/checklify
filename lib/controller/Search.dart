import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/model/supportClasses/SearchedTask.dart';
import 'package:checklist_app/model/supportClasses/TaskPath.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/cupertino.dart';
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
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final appState = context.watch<AppState>();

    List<SearchedTask> searchedTasks;

    //if (query.isEmpty)
      //suggestionList = recentList;
    //else
      {
        TaskPath taskPath = appState.taskPath.getCopy();
        taskPath.backToPrevious();
        searchedTasks = appState.task.searchTasks(
            query, taskPath);
      }
    return ListView.builder(
        itemCount: searchedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              searchedTasks[index].task.title,
            ),
            subtitle: Text(
              searchedTasks[index].taskPath.toString(),
            ),
            onTap: () {
              appState.openTask(searchedTasks[index].task);
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final darkState = context.watch<DarkThemeState>();
    return Styles.themeData(darkState.darkTheme, context);
  }
}
