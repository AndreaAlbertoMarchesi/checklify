import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {

  static Color getColor(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.grey[800];
    }else{
      return Colors.lightBlue[50];
    }
  }

  static Color getFont(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.blue[200];
    }else{
      return Colors.blue[800];
    }
  }
  static Color getBorder(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.black12;
    }else{
      return Colors.lightBlue[100];
    }
  }
  static Color getSideMenu(bool isDarkTheme){
    if(isDarkTheme){
      return Color(0xff121212);
    }else{
      return Colors.lightBlue[200];
    }
  }
  static Color getAppBarIcon(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.blue[200];
    }else{
      return Colors.lightBlue[50];
    }
  }




  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: isDarkTheme? Color(0xff121212) : Colors.white,
      canvasColor: isDarkTheme ? Color(0xff121212) : Colors.lightBlue[50] ,

      textTheme: TextTheme().apply(
        bodyColor: isDarkTheme ? Colors.black : Colors.black,
        displayColor: isDarkTheme ? Colors.black : Colors.black,
      ),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Colors.blue[200] : Colors.blue[800],

      highlightColor: isDarkTheme ? Colors.blueGrey: Colors.lightBlue[100],
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),


      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.black : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,

      floatingActionButtonTheme: FloatingActionButtonThemeData(foregroundColor: Colors.white,),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        shadowColor: Colors.black,
        elevation: 10.0,
      ),
    );

  }
}