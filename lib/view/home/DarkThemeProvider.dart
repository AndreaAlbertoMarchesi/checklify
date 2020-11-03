import 'package:checklist_app/model/DarkThemeState.dart';
import 'file:///C:/Users/Ilaria/AndroidStudioProjects/checklify/lib/controller/SharedPreferences.dart';
import 'package:checklist_app/view/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DarkThemeProvider extends StatelessWidget {
  final DarkThemePreferences darkThemePreferences;


  DarkThemeProvider(this.darkThemePreferences);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DarkThemeState(darkThemePreferences),
        child: Home());
  }
}