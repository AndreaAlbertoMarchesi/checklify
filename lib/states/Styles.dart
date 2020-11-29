

part of 'package:checklist_app/states/Settings.dart';
class _Styles {

  static List<ColorSwatch<dynamic>> getPossibleColors(){
    List<ColorSwatch<dynamic>> colors = [];

    colors.add(createMaterialColor(Colors.grey[200]));
    colors.add(createMaterialColor(Colors.deepOrange[300]));
    colors.add(createMaterialColor(Colors.red[300]));
    colors.add(createMaterialColor(Colors.pink[300]));
    colors.add(createMaterialColor(Colors.deepPurple[300]));
    colors.add(createMaterialColor(Colors.blue[300]));
    colors.add(createMaterialColor(Colors.tealAccent[200]));
    colors.add(createMaterialColor(Colors.green[300]));
    return colors;
  }

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  static Color getColor(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.blueGrey[800];
    }else{
      return Colors.blue[300];
    }
  }

  static Color getHighlightedColor(int colorValue) {

    if(colorValue == Colors.blue[300].hashCode){
      return Colors.blue[600];
    }else if(colorValue == Colors.red[300].hashCode){
      return Colors.red[500];
    }else if(colorValue == Colors.deepPurple[300].hashCode){
      return Colors.deepPurple[500];
    }else if(colorValue == Colors.green[300].hashCode){
      return Colors.green[500];
    }else if(colorValue == Colors.deepOrange[300].hashCode){
      return Colors.deepOrange[500];
    }else if(colorValue == Colors.pink[300].hashCode){
      return Colors.pink[500];
    }else if(colorValue == Colors.tealAccent[200].hashCode){
      return Colors.tealAccent[700];
    }else
      return Colors.grey[500];
  }

  static Color getFont(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.blue[200];
    }else{
      return Colors.blue[800];
    }
  }
  static Color getFontTiles(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.black54;
    }else{
      return Colors.black54;
    }
  }

  static Color getShadowParent(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.grey[900];
    }else{
      return Colors.blue[600];
    }
  }

  static Color getBorder(bool isDarkTheme){
    if(isDarkTheme){
      return Colors.black12;
    }else{
      return Colors.lightBlue[300];
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

  static double getFontSizeChildren(String size){
    double s;
    switch (size){
      case 'Small':
        s = 13;
        break;
      case 'Medium':
        s = 17;
        break;
      case 'Big':
        s = 23;
        break;
    }
    return s;
  }
  static double getFontSizeParent(String size){
    double s;
    switch (size){
      case 'Small':
        s = 22;
        break;
      case 'Medium':
        s = 29;
        break;
      case 'Big':
        s = 34;
        break;
    }
    return s;
  }
  static double getTileSizeChildren(String size){
    double s;
    switch (size){
      case 'Small':
        s = 40;
        break;
      case 'Medium':
        s = 45;
        break;
      case 'Big':
        s = 55;
        break;
    }
    return s;
  }
  static double getTileSizeParent(String size){
    double s;
    switch (size){
      case 'Small':
        s = 22;
        break;
      case 'Medium':
        s = 29;
        break;
      case 'Big':
        s = 36;
        break;
    }
    return s;
  }
  static double getPercentageSizeChildren(String size){
    double s;
    switch (size){
      case 'Small':
        s = 33;
        break;
      case 'Medium':
        s = 38;
        break;
      case 'Big':
        s = 48;
        break;
    }
    return s;
  }
  static double getPercentageSizeParent(String size){
    double s;
    switch (size){
      case 'Small':
        s = 38;
        break;
      case 'Medium':
        s = 45;
        break;
      case 'Big':
        s = 53;
        break;
    }
    return s;
  }
  static double getFontPercentageChildren(String size){
    double s;
    switch (size){
      case 'Small':
        s = 9.5;
        break;
      case 'Medium':
        s = 11.5;
        break;
      case 'Big':
        s = 17;
        break;
    }
    return s;
  }
  static double getFontPercentageParent(String size){
    double s;
    switch (size){
      case 'Small':
        s = 10.5;
        break;
      case 'Medium':
        s = 13;
        break;
      case 'Big':
        s = 18.5;
        break;
    }
    return s;
  }
  static double getFontSizeCoffee(String size) {
    double s;
    switch (size) {
      case 'Small':
        s = 13;
        break;
      case 'Medium':
        s = 15;
        break;
      case 'Big':
        s = 16;
        break;
    }
    return s;
  }

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: isDarkTheme? Color(0xff121212) : Colors.lightBlue[100],
      canvasColor: isDarkTheme ? Color(0xff121212) : Colors.lightBlue[100] ,

      textTheme: TextTheme().apply(
        bodyColor: isDarkTheme ? Colors.black : Colors.black,
        displayColor: isDarkTheme ? Colors.black : Colors.black,
      ),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),

      hintColor: isDarkTheme ? Colors.blue[200] : Colors.blue[800],

      highlightColor: isDarkTheme ? Colors.blueGrey: Colors.lightBlue[100],
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),


      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.lightBlue[100],
      unselectedWidgetColor: isDarkTheme ? Colors.black54 : Colors.black54 ,

      floatingActionButtonTheme: FloatingActionButtonThemeData(foregroundColor: Colors.white,),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        shadowColor: Colors.black,
        elevation: 10.0,
      ),
    );

  }
}