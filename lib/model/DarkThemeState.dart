import 'package:checklist_app/view/Settings/SharedPreferences.dart';
import 'package:flutter/material.dart';

class DarkThemeState with ChangeNotifier {

  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool darkTheme = false;

  DarkThemeState(){
    darkThemePreference.getTheme().then((value) {
      if(value == null)
        darkTheme = false;
      else
        darkTheme = value;
      notifyListeners();
    });
  }

  getTheme() async {
    darkTheme = await darkThemePreference.getTheme();
    if(darkTheme == null)
      darkTheme = false;
    notifyListeners();
  }

  setDarkTheme(bool value) {
    darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}