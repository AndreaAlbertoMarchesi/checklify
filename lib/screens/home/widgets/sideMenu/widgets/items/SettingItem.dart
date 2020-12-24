import 'package:checklist_app/screens/settings/SettingsPage.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();

    return ListTile(
      leading: Icon(Icons.settings),
      title: AppTextDecoration('Settings',
          fontSize: settings.getFontSizeChildren(),
          fontWeight: FontWeight.bold,
          color: settings.getFont()),
      onTap: () {
        appState.deselect();
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsPage()));
      },
    );
  }
}
