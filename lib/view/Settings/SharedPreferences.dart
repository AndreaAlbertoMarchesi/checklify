import 'dart:convert';
import 'package:checklist_app/model/AppUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  bool darkTheme;

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS);
  }
}

class UserPreference{

  static const PHOTO_ANON = "https://icon-library.com/images/profile-42914__340.png";


  setUser(AppUser user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  Future<AppUser> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user") != null)
      return AppUser.fromJson(jsonDecode(prefs.getString("user")));
    else
      return AppUser(userName: "Anonymous", photoURL:PHOTO_ANON , isAnon: true);
  }

}