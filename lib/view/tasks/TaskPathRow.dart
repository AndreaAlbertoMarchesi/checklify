import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskPathRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:
          /*PopupMenuButton(
            elevation: 3.2,
            icon: Icon(Icons.arrow_back),
            onSelected: (task) {
              appState.backToTask(task);
            },
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'Path',
            itemBuilder: (BuildContext context) {
              return appState.taskPath
                  .map((Task choice) {
                    return PopupMenuItem(
                      value: choice,
                      child: Text(choice.title),
                    );
                  })
                  .toList()
                  .sublist(0, appState.taskPath.length - 1);
            }),*/
          Container(
        constraints: BoxConstraints.tightForFinite(height: 40),
        child: Row(
          children: appState.taskPath.taskList
              .map((task) {
                return InkWell(
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                            Icons.arrow_forward_ios_rounded,
                          color: Styles.getFont(darkState.darkTheme),
                          size: Styles.getFontSizeChildren(appState.size),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        task.title,
                        style: TextStyle(
                          color: Styles.getFont(darkState.darkTheme),
                            fontSize: Styles.getFontSizeChildren(appState.size),
                        ),
                      ),
                    )
                  ]),
                  onTap: () {
                    appState.backToTask(task);
                  },
                );
              })
              .toList()
              .sublist(0, appState.taskPath.getLength()),
        ),
      ),
    );
  }
}
