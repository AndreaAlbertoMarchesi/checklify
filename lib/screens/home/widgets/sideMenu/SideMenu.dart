import 'dart:io';

import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/dialogs/DonateDialog.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/selectionList/SelectionList.dart';
import 'package:checklist_app/screens/intro/IntroApp.dart';
import 'package:checklist_app/screens/settings/SettingsPage.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
                          padding: EdgeInsets.all(15),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: appState.isPhotoFromGallery
                                ? FileImage(File(appState.appUser.photoURL))
                                : AssetImage("${appState.appUser.photoURL}"),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Text(
                          appState.appUser.userName,
                          style: TextStyle(
                            fontSize: Styles.getFontSizeChildren(appState.size),
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.bold,
                            color: Styles.getFont(darkState.darkTheme),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Styles.getSideMenu(darkState.darkTheme)),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: Styles.getFontSizeChildren(appState.size),
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
                        fontSize: Styles.getFontSizeChildren(appState.size),
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
                        fontSize: Styles.getFontSizeChildren(appState.size),
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        color: Styles.getFont(darkState.darkTheme),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IntroScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(AntDesign.gift),
                    title: Text(
                      'Buy me a coffee',
                      style: TextStyle(
                        fontSize: Styles.getFontSizeChildren(appState.size),
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        color: Styles.getFont(darkState.darkTheme),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      openAddDialog(context);
                    },
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

  void openAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DonateDialog();
      },
    );
  }
}
