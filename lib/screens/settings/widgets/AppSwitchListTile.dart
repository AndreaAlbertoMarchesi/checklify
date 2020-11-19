import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';


class AppSwitchListTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final bool value;
  final Function function;

  AppSwitchListTile({this.title, this.icon, this.value, this.function});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return SwitchListTile(
      secondary: Icon(icon),
      value: value,
      title: Text(
        title,
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
        ),
      ),
      onChanged: (value) {
        if (settings.vibrate)
          Vibration.vibrate(duration: 20);
        function(value);
      },
    );
  }

}
