import 'file:///C:/Users/Ilaria/AndroidStudioProjects/checklify/lib/controller/SharedPreferences.dart';
import 'package:flutter/material.dart';

class DarkThemeState with ChangeNotifier {

  final DarkThemePreferences darkThemePreferences;
  bool darkTheme;

  DarkThemeState(this.darkThemePreferences){
    darkTheme = darkThemePreferences.darkTheme;
    notifyListeners();
    /*darkThemePreference.getTheme().then((value) {
      if(value == null)
        darkTheme = false;
      else
        darkTheme = value;
      notifyListeners();
    });*/
  }

  /*getTheme() async {
    darkTheme = await darkThemePreferences.getTheme();
    if(darkTheme == null)
      darkTheme = false;
    notifyListeners();
  }*/

  setDarkTheme(bool value) {
    darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}