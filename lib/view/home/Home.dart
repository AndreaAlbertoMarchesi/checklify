import 'package:checklist_app/controller/Search.dart';
import 'package:checklist_app/controller/Storage.dart';
import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:checklist_app/view/home/buttons/AddButton.dart';
import 'package:checklist_app/view/home/sideMenu/SideMenu.dart';
import 'package:checklist_app/view/tasks/ParentTaskItem.dart';
import 'package:checklist_app/view/tasks/TaskPathRow.dart';
import 'package:checklist_app/view/tasks/tasksList/TasksList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'IntroApp.dart';

class Home extends StatefulWidget {
  final Storage storage = Storage();

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final darkState = context.watch<DarkThemeState>();
    final appState = context.watch<AppState>();


    return MaterialApp(
      theme: Styles.themeData(darkState.darkTheme, context),
      home: appState.userPreferences.firstTime
      ? IntroScreen()
      : HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();
    int selectionLength = appState.getSelectedTasks().length;

    return WillPopScope(
      onWillPop: () async {
        appState.backToPreviousTask();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(
              color: Styles.getFont(darkState.darkTheme)
          ),
          leading: Builder(
            builder: (context) => Container(
              child: Stack(
                children: [
                  if (selectionLength > 0)
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(selectionLength.toString())),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Styles.getAppBarIcon(darkState.darkTheme),
                      size: 30,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Builder(
                builder: (context) => IconButton(
                    icon: Icon(
                      Icons.search_outlined,
                      color: Styles.getAppBarIcon(darkState.darkTheme),
                      size: 30,
                    ),
                    onPressed: (){
                      showSearch(context: context, delegate: Search());
                    }
                )
            ),
          ],
        ),
        body: Column(
          children: [
            TaskPathRow(),
            ParentTaskItem(),
            TasksList(),
          ],
        ),
        drawer: SideMenu(),
        bottomNavigationBar: AddButton(),
      ),
    );
  }
}
