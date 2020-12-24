import 'package:checklist_app/screens/settings/widgets/settingsSection/AssistanceSettings.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/GeneralSettings.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextDecoration("About",
              fontSize: settings.getFontSizeChildren(),
              fontStyle: FontStyle.italic,
              color: settings.getFont()),
        ),
        AppTextDecoration("version 1.0.0",
            fontSize: settings.getFontSizeCoffee())
      ],
    ));
  }
}
