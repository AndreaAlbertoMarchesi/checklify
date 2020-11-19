import 'dart:io';
import 'package:checklist_app/screens/settings/widgets/AppSwitchListTile.dart';
import 'package:checklist_app/screens/settings/widgets/dialogs/ModifyName.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/BottomSheet.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    double radius = 50;
    double iconSize = 30;
    double distance = 10;
    const List<String> FONTS = ["Small", "Medium", "Big"];

    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'smith@example.com',
        queryParameters: {'subject': 'Report a Bug'});

    _setDarkMode(darkTheme) {
      settings.setDarkTheme(darkTheme);
    }
    _setVibration(vibration) {
      settings.setVibration(vibration);
    }
    _setNotification(notifications) {
      settings.setNotification(notifications);
    }
    _setFullScreen(fullScreen) {
      settings.setFullScreen(fullScreen);
    }


    if(settings.fullScreen)
      SystemChrome.setEnabledSystemUIOverlays([]);
    else
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: settings.isPhotoFromGallery
                              ? FileImage(File(settings.appUser.photoURL))
                              : AssetImage("${settings.appUser.photoURL}"),
                          backgroundColor: Colors.transparent,
                          radius: radius,
                          //background image
                        ),
                        Positioned(
                            top: -(iconSize + radius - 30),
                            right: -(radius - 40 + iconSize - distance),
                            bottom: iconSize,
                            left: radius,
                            child: Icon(
                              Icons.auto_awesome,
                              color: Colors.blue,
                              size: iconSize,
                            )),
                      ]),
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
                        Icon(Icons.create_outlined),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            settings.appUser.userName,
                            style: TextStyle(
                              fontSize:
                                  settings.getFontSizeChildren(),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  onPressed: () {
                    openAddDialog(context);
                  },
                ),
              ),
            ),
            AppSwitchListTile(title: "Dark mode",
                icon: Icons.lightbulb_outline,
                value: settings.darkTheme,
                function: _setDarkMode
            ),
            ListTile(
              title: Text(
                "Select the Font Size",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren(),
                ),
              ),
              leading: Icon(Icons.text_fields_rounded),
              trailing: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return FONTS.map((fontSize) {
                    return PopupMenuItem(
                      value: fontSize,
                      child: Text(
                        fontSize,
                        style: TextStyle(
                          fontSize: settings.getFontSizeChildren(),
                        ),
                      ),
                    );
                  }).toList();
                },
                tooltip: "Size",
                onSelected: (fontSize) {
                  settings.setFontSize(fontSize);
                },
              ),
            ),
            AppSwitchListTile(title: "Vibration",
                icon: Icons.vibration_rounded,
                value: settings.vibrate,
                function: _setVibration
            ),
            AppSwitchListTile(title: "Notifications",
                icon: Icons.notifications_active_outlined,
                value: settings.notifications,
                function: _setNotification
            ),
            AppSwitchListTile(title: "FullScreen",
                icon: Icons.fullscreen,
                value: settings.fullScreen,
                function: _setFullScreen
            ),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: Text(
                "Report a bug",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren(),
                ),
              ),
              subtitle: Text(
                "Write an email to notify a bug",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren() - 4.0,
                ),
              ),
              onTap: () {
                launch(_emailLaunchUri.toString());
              },
            ),
            /*ListTile(
              title: Center(child: Text(
                  "Terms & Conditions",
                style: TextStyle(
                  fontSize: Styles.getFontSizeChildren(appState.size),
                ),
              )),
              subtitle: Center(child: Text(
                  "Click to know more about terms and conditions",
                style: TextStyle(
                  fontSize: Styles.getFontSizeChildren(appState.size)-7.0,
                ),
              )),
              onTap: (){

              },
            ),*/
            Center(
                child: Text(
              "version 1.0.0",
              style: TextStyle(
                fontSize: settings.getFontSizeChildren(),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return AppBottomSheet();
        });
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
