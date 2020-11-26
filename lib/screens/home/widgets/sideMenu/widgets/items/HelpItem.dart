import 'package:checklist_app/screens/intro/IntroApp.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return ListTile(
      leading: Icon(Icons.help_outline),
      title: Text(
        'Help',
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: settings.getFont(),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IntroScreen()));
      },
    );
  }
}