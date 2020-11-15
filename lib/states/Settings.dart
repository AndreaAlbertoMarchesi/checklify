import 'package:checklist_app/models/AppUser.dart';
import 'package:checklist_app/utils/PhoneStorage.dart';
import 'package:checklist_app/utils/phoneStorage/Keys.dart';
import 'package:flutter/material.dart';

part 'Styles.dart';
class Settings with ChangeNotifier {
  

  final PhoneStorage _storage;

  AppUser appUser;
  bool firstTime;
  bool isPhotoFromGallery = false;
  bool termsAndCondsAccepted = false;
  String size;
  String fontSize;
  bool vibrate;
  bool darkTheme;

  Settings(this._storage) {
    darkTheme = _storage.getValue(Keys.darkTheme, false);
    size = _storage.getValue(Keys.size, 'Medium');
    vibrate = _storage.getValue(Keys.size, false);
    appUser = _storage.getValue(Keys.appUser, AppUser.anonymous);
    firstTime = _storage.getValue(Keys.firstTime, true);
  }

  void acceptTermsConditions() {
    termsAndCondsAccepted = true;
    _storage.setValue(Keys.firstTime, false);
    notifyListeners();
  }

  set setDarkTheme(bool darkTheme) {
    this.darkTheme = darkTheme;
    _storage.setValue(Keys.darkTheme, darkTheme);
    notifyListeners();
  }

  set setFontSize(String size) {
    this.size = size;
    notifyListeners();
  }

  set setVibration(bool vibrate) {
    this.vibrate = vibrate;
    notifyListeners();
  }

  set modifyName(String name) {
    appUser.userName = name;
    notifyListeners();
  }

  void modifyPhoto(String path) {
    appUser.photoURL = path;
    if (path.startsWith('images', 0))
      isPhotoFromGallery = false;
    else
      isPhotoFromGallery = true;
    notifyListeners();
  }

  Color getColor() => _Styles.getColor(darkTheme);

  Color getFont() => _Styles.getFont(darkTheme);

  Color getBorder() => _Styles.getBorder(darkTheme);

  Color getSideMenu() => _Styles.getSideMenu(darkTheme);

  Color getAppBarIcon() => _Styles.getAppBarIcon(darkTheme);

  double getFontSizeChildren() => _Styles.getFontPercentageChildren(size);

  double getFontSizeParent() => _Styles.getFontSizeParent(size);

  double getTileSizeChildren() => _Styles.getTileSizeChildren(size);

  double getTileSizeParent() => _Styles.getTileSizeParent(size);

  double getPercentageSizeChildren() => _Styles.getPercentageSizeChildren(size);

  double getPercentageSizeParent() => _Styles.getPercentageSizeParent(size);

  double getFontPercentageChildren() => _Styles.getFontPercentageChildren(size);

  double getFontPercentageParent() => _Styles.getFontPercentageParent(size);

  double getFontSizeCoffee() => _Styles.getFontSizeCoffee(size);

  ThemeData themeData(BuildContext context) =>
      _Styles.themeData(darkTheme, context);
}
