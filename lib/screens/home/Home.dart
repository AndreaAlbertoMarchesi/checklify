import 'package:checklist_app/screens/home/widgets/ParentTaskItem.dart';
import 'package:checklist_app/screens/home/widgets/Search.dart';
import 'package:checklist_app/screens/home/widgets/TaskPathRow.dart';
import 'package:checklist_app/screens/home/widgets/buttons/AddButton.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/SideMenu.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/TasksList.dart';
import 'package:checklist_app/screens/intro/IntroApp.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: settings.themeData(context),
      home: settings.firstTime ? IntroScreen() : HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();
    int selectionLength = appState.getSelectedTasks().length;


    if(settings.fullScreen)
      SystemChrome.setEnabledSystemUIOverlays([]);
    else
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return WillPopScope(
      onWillPop: () async {
        appState.backToPreviousTask();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        extendBody: true,
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: settings.getFont()),
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
                      color: settings.getAppBarIcon(),
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
                      color: settings.getAppBarIcon(),
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
