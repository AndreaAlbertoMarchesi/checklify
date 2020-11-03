import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/view/home/DarkThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Users/Ilaria/AndroidStudioProjects/checklify/lib/controller/SharedPreferences.dart';



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
