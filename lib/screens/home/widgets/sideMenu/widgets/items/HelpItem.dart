import 'package:checklist_app/screens/intro/IntroApp.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();
    return ListTile(
      leading: Icon(Icons.help_outline),
      title: AppTextDecoration('Help',
          fontSize: settings.getFontSizeChildren(),
          color: settings.getFont()),
      onTap: () {
        appState.deselect();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => IntroScreen()));
      },
    );
  }
}
