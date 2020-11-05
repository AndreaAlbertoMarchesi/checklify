import 'dart:io';

import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/Settings/BottomSheet.dart';
import 'package:checklist_app/view/home/dialogs/ModifyName.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomSheet.dart';
import 'Styles.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    final darkThemeState = context.watch<DarkThemeState>();
    final appState = context.watch<AppState>();

    double radius = 50;
    double iconSize = 30;
    double distance = 10;
    const List<String> FONTS =["Small", "Medium", "Big"];


    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: (){
                  _settingModalBottomSheet(context);
                },
                child: Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children : [
                    CircleAvatar(
                      backgroundImage: appState.isPhotoFromGallery
                      ? FileImage(File(appState.appUser.photoURL))
                      : AssetImage("${appState.appUser.photoURL}"),
                      backgroundColor: Colors.transparent,
                      radius: radius,
                      //background image
                    ),
                    Positioned(
                        top: -(iconSize + radius-30),
                        right: -(radius-40 + iconSize - distance),
                        bottom: iconSize,
                        left: radius,
                        child: Icon(
                          Icons.auto_awesome,
                          color: Colors.blue,
                          size: iconSize,
                        )
                    ),
                  ]
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.autorenew),
                      Container(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            appState.appUser.userName,
                          style: TextStyle(
                            fontSize: Styles.getFontSizeChildren(appState.size),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                onPressed: (){
                  openAddDialog(context);
                },
              ),
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.lightbulb_outline),
            value: darkThemeState.darkTheme,
            title: Text(
                "Dark mode",
              style: TextStyle(
                fontSize: Styles.getFontSizeChildren(appState.size),
              ),
            ),
            onChanged: (value) {
              darkThemeState.setDarkTheme(value);
            },
          ),
          ListTile(
            title: Text(
                "Select the Font Size",
              style: TextStyle(
                fontSize: Styles.getFontSizeChildren(appState.size),
              ),
            ),
            leading: Icon(Icons.text_fields_rounded),
            trailing : PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return FONTS.map((fontSize) {
                  return PopupMenuItem(
                      value: fontSize,
                      child: Text(
                          fontSize,
                          style: TextStyle(
                            fontSize: Styles.getFontSizeChildren(appState.size),
                          ),
                      ),);
                }).toList();
              },
              tooltip: "Size",
              onSelected: (fontSize) {
                appState.setFontSize(fontSize);
              },
            ),
          ),
          ListTile(
            title: Center(child: Text(
                "Terms & Conditions",
              style: TextStyle(
                fontSize: Styles.getFontSizeChildren(appState.size),
              ),
            )),
            subtitle: Center(child: Text(
                "Click to know more about terms and conditions",
              style: TextStyle(
                fontSize: Styles.getFontSizeChildren(appState.size)-4.0,
              ),
            )),
            onTap: (){
              
            },
          ),
          Center(child: Text(
            "version 1.0.0",
            style: TextStyle(
              fontSize: Styles.getFontSizeChildren(appState.size),
            ),
          ))
        ],
      ),
    );
  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return AppBottomSheet();
        }
    );
  }
  void openAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ModifyName();
      },
    );
  }

}
