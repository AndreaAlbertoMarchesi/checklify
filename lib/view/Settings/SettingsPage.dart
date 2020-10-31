import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    final darkThemeState = context.watch<DarkThemeState>();
    final appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage("${appState.appUser.photoURL}"),
                backgroundColor: Colors.transparent,
                radius: 50,
                //background image
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(appState.appUser.userName),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.lightbulb_outline),
            value: darkThemeState.darkTheme,
            title: Text("Dark mode"),
            onChanged: (value) {
              darkThemeState.setDarkTheme(value);
            },
          ),
          ListTile(
            title: Center(child: Text("Terms & Conditions")),
            subtitle: Center(child: Text("Click to know more about terms and conditions")),
            onTap: (){

            },
          ),
          Center(child: Text("version 1.0.0"))
        ],
      ),
    );
  }
}
