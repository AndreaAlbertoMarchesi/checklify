import '../utils/SharedPreferences.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/Home.dart';



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