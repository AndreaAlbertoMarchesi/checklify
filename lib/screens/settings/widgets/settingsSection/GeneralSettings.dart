import 'package:checklist_app/screens/settings/widgets/AppSwitchListTile.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GeneralSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    const List<String> FONTS = ["Small", "Medium", "Big"];

    _setDarkMode(darkTheme) {
      settings.setDarkTheme(darkTheme);
    }

    _setVibration(vibration) {
      settings.setVibration(vibration);
    }


    _setFullScreen(fullScreen) {
      settings.setFullScreen(fullScreen);
    }

    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "General",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren(),
                  letterSpacing: 0.6,
                  fontStyle: FontStyle.italic,
                  color: settings.getFont(),
                ),
              ),
            ),
            AppSwitchListTile(
                title: "Dark mode",
                icon: Icons.lightbulb_outline,
                value: settings.darkTheme,
                function: _setDarkMode),
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
            AppSwitchListTile(
                title: "FullScreen",
                icon: Icons.fullscreen,
                value: settings.fullScreen,
                function: _setFullScreen),
            AppSwitchListTile(
                title: "Vibration",
                icon: Icons.vibration_rounded,
                value: settings.vibrate,
                function: _setVibration),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: settings.getColor()
              ),
            )
        )
    );
  }
}
