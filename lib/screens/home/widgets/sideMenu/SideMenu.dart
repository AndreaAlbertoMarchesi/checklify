import 'dart:io';

import 'file:///C:/Users/AndreaMarchesi/AndroidStudioProjects/checklify/lib/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/DonateDialog.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/HelpItem.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/SettingItem.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/DonateItem.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/timelineItem/TimelineItem.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/selectionList/SelectionList.dart';
import 'package:checklist_app/screens/intro/IntroApp.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();
    return Theme(
      data: settings.themeData(context),
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
                            backgroundImage: settings.isPhotoFromGallery
                                ? FileImage(File(settings.appUser.photoURL))
                                : AssetImage("${settings.appUser.photoURL}"),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Text(
                          settings.appUser.userName,
                          style: TextStyle(
                            fontSize: settings.getFontSizeChildren(),
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.bold,
                            color: settings.getFont(),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(color: settings.getSideMenu()),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: settings.getFontSizeChildren(),
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.bold,
                        color: settings.getFont(),
                      ),
                    ),
                    onTap: () {
                      appState.backToRoot();
                      Navigator.of(context).pop();
                    },
                  ),
                  SettingItem(),
                  HelpItem(),
                  DonateItem(),
                  TimelineItem(),
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
