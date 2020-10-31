import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/Settings/BottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomSheet.dart';

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
                      backgroundImage: NetworkImage("${appState.appUser.photoURL}"),
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
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.autorenew),
                    Container(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(appState.appUser.userName),
                    )),
                  ],
                ),
                onTap: (){

                },
              ),
            ),
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
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return AppBottomSheet();
        }
    );
  }
}
