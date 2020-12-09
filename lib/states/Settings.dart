import 'package:checklist_app/models/AppUser.dart';
import 'package:checklist_app/utils/PhoneStorage.dart';
import 'package:checklist_app/utils/URL.dart';
import 'package:checklist_app/utils/phoneStorage/Keys.dart';
import 'package:flutter/material.dart';

part 'SettingsParts/Styles.dart';
class Settings with ChangeNotifier {
  

  final PhoneStorage _storage;

  AppUser appUser;
  bool firstTime;
  bool isPhotoFromGallery ;
  bool termsAndCondsAccepted = false;
  String fontSize;
  bool darkTheme;
  bool vibrate;
  bool fullScreen;
  bool notifications;


  Settings(this._storage) {
    darkTheme = _storage.getValue(Keys.darkTheme, false);
    fontSize = _storage.getValue(Keys.size, 'Medium');
    vibrate = _storage.getValue(Keys.vibrate, false);
    appUser = _storage.readUser(Keys.appUser, AppUser.anonymous);
    firstTime = _storage.getValue(Keys.firstTime, true);
    fullScreen = _storage.getValue(Keys.fullScreen, false);
    notifications = _storage.getValue(Keys.notifications, true);
    isPhotoFromGallery = _storage.getValue(Keys.isPhotoFromGallery, false);
  }

  void acceptTermsConditions() {
    termsAndCondsAccepted = true;
    _storage.setValue(Keys.firstTime, false);
    notifyListeners();
  }

  void setDarkTheme(bool darkTheme) {
    this.darkTheme = darkTheme;
    _storage.setValue(Keys.darkTheme, darkTheme);
    notifyListeners();
  }

  void setFontSize(String size) {
    this.fontSize = size;
    _storage.setValue(Keys.size, size);
    notifyListeners();
  }

  void setVibration(bool vibrate) {
    this.vibrate = vibrate;
    _storage.setValue(Keys.vibrate, vibrate);
    notifyListeners();
  }
  void setFullScreen(bool fullScreen){
    this.fullScreen = fullScreen;
    _storage.setValue(Keys.fullScreen, fullScreen);
    notifyListeners();
  }
  void setNotification(bool notifications){
    this.notifications = notifications ;
    _storage.setValue(Keys.notifications, notifications);
    notifyListeners();
  }

  void modifyName(String name) {
    appUser.userName = name;
    _storage.writeUser(Keys.appUser, appUser);
    notifyListeners();
  }

  void modifyPhoto(String path) {
    appUser.photoURL = path;
    if (path.startsWith(URL.imagesFolder, 0)) {
      isPhotoFromGallery = false;
      _storage.setValue(Keys.isPhotoFromGallery, false);
    }else {
      isPhotoFromGallery = true;
      _storage.setValue(Keys.isPhotoFromGallery, true);
    }
    _storage.writeUser(Keys.appUser, appUser);
    notifyListeners();
  }

  Color getColor() => _Styles.getColor(darkTheme);

  Color getFont() => _Styles.getFont(darkTheme);

  Color getFontTiles() => _Styles.getFontTiles(darkTheme);

  Color getBorder() => _Styles.getBorder(darkTheme);

  Color getShadowParent() => _Styles.getShadowParent(darkTheme);

  Color getSideMenu() => _Styles.getSideMenu(darkTheme);

  Color getAppBarIcon() => _Styles.getAppBarIcon(darkTheme);

  Color getHighlightedColor(int colorValue) => _Styles.getHighlightedColor(colorValue);

  List<ColorSwatch<dynamic>> getPossibleColors() => _Styles.getPossibleColors();

  double getFontSizeChildren() => _Styles.getFontSizeChildren(fontSize);

  double getFontSizeParent() => _Styles.getFontSizeParent(fontSize);

  double getTileSizeChildren() => _Styles.getTileSizeChildren(fontSize);

  double getTileSizeParent() => _Styles.getTileSizeParent(fontSize);

  double getPercentageSizeChildren() => _Styles.getPercentageSizeChildren(fontSize);

  double getPercentageSizeParent() => _Styles.getPercentageSizeParent(fontSize);

  double getFontPercentageChildren() => _Styles.getFontPercentageChildren(fontSize);

  double getFontPercentageParent() => _Styles.getFontPercentageParent(fontSize);

  double getFontSizeCoffee() => _Styles.getFontSizeCoffee(fontSize);

  ThemeData themeData(BuildContext context) =>
      _Styles.themeData(darkTheme, context);


}
