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

}

class UserPreferences{

  static const PHOTO_ANON = "images/dog.png";

  AppUser appUser;
  bool firstTime = true;
  bool isPhotoFromGallery = false;

  setUser(AppUser user) async{
    appUser = user;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user") != null) {
      appUser = AppUser.fromJson(jsonDecode(prefs.getString("user")));
      firstTime = false;
      if(appUser.photoURL.startsWith('images',0))
        isPhotoFromGallery = false;
      else
        isPhotoFromGallery = true;
    }else {
      appUser = AppUser(userName: "Anonymous", photoURL: PHOTO_ANON, isAnon: true, fontSize: "Medium", vibrate: true);
      firstTime = true;
      isPhotoFromGallery = false;
    }
  }

}