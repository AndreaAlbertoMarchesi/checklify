import 'dart:io';

import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/Settings/SettingsPage.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:checklist_app/view/home/sideMenu/selectionList/SelectionList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();
    return Theme(
      data: Styles.themeData(darkState.darkTheme, context),
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: appState.isPhotoFromGallery
                                  ? AssetImage("${appState.appUser.photoURL}")
                                  : FileImage(File(appState.appUser.photoURL)),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Text(
                            appState.appUser.userName,
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              color: Styles.getFont(darkState.darkTheme),
                            ),
                          )
                        ],
                      ),
                    decoration: BoxDecoration(
                      color: Styles.getSideMenu(darkState.darkTheme)
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text(
                        "Home",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        color: Styles.getFont(darkState.darkTheme),
                      ),
                    ),
                    onTap: () {
                      appState.backToRoot();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                        'Settings',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        color: Styles.getFont(darkState.darkTheme),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text(
                        'Help',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        color: Styles.getFont(darkState.darkTheme),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            if (appState.getSelectedTasks().isNotEmpty) SelectionList(),
          ],
        ),
      ),
    );
  }
}
