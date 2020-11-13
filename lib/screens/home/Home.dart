import 'package:checklist_app/screens/home/widgets/ParentTaskItem.dart';
import 'package:checklist_app/screens/home/widgets/Search.dart';
import 'package:checklist_app/screens/home/widgets/TaskPathRow.dart';
import 'package:checklist_app/screens/home/widgets/buttons/AddButton.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/SideMenu.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/TasksList.dart';
import 'package:checklist_app/screens/intro/IntroApp.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkState = context.watch<DarkThemeState>();
    final appState = context.watch<AppState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(darkState.darkTheme, context),
      home: appState.userPreferences.firstTime ? IntroScreen() : HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
        extendBody: true,
        appBar: AppBar(
          actionsIconTheme:
              IconThemeData(color: Styles.getFont(darkState.darkTheme)),
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
                    onPressed: () {
                      showSearch(context: context, delegate: Search());
                    })),
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
