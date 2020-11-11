import '../utils/SharedPreferences.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DarkThemeProvider.dart';



class AppStateProvider extends StatelessWidget {

  final AppPreferences _appPreferences;


  AppStateProvider(this._appPreferences);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppState(_appPreferences.userPreferences),
        child: DarkThemeProvider(_appPreferences.darkThemePreferences)
    );
  }
}
