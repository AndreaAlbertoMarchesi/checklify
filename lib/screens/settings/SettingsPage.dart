import 'package:checklist_app/screens/settings/widgets/settingsSection/AboutSection.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/AssistanceSettings.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/GeneralSettings.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/accountSettings/AccountSettings.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    if (settings.fullScreen)
      SystemChrome.setEnabledSystemUIOverlays([]);
    else
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "Settings",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AccountSettings(),
            GeneralSettings(),
            /*NotificationSettings(),
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
                  fontSize: Styles.getFontSizeChildren(appState.size)-7.0,
                ),
              )),
              onTap: (){

              },
            ),*/
            AssistanceSettings(),
            AboutSection()
          ],
        ),
      ),
    );
  }
}
