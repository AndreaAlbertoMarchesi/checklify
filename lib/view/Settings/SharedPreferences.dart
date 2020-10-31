import 'dart:convert';
import 'package:checklist_app/model/AppUser.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences{

  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  UserPreferences userPreferences = UserPreferences();

  getPreferences() async {
    await darkThemePreferences.getTheme();
    await userPreferences.getUser();
  }
}


class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  bool darkTheme;

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<void> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darkTheme = prefs.getBool(THEME_STATUS);
    if(darkTheme == null)
      darkTheme = false;
  }

  /*Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS);
  }*/
}

class UserPreferences{

  static const PHOTO_ANON = "https://icon-library.com/images/profile-42914__340.png";

  AppUser appUser;

  setUser(AppUser user) async{
    appUser = user;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user") != null)
      appUser = AppUser.fromJson(jsonDecode(prefs.getString("user")));
    else
      appUser = AppUser(userName: "Anonymous", photoURL:PHOTO_ANON , isAnon: true);
  }


  /*Future<AppUser> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user") != null)
      return AppUser.fromJson(jsonDecode(prefs.getString("user")));
    else
      return AppUser(userName: "Anonymous", photoURL:PHOTO_ANON , isAnon: true);
  }*/

}