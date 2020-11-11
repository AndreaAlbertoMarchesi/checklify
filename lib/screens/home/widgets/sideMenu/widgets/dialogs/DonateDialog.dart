import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';


class DonateDialog extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();

    Widget backButton(context) {
      return FlatButton(
        child: Text(
          "Back",
          style: TextStyle(
            fontSize: Styles.getFontSizeChildren(appState.size),
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: Styles.getFont(darkState.darkTheme),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    return AlertDialog(
      scrollable: true,
      title: Text(
          "Buy a coffee to the team ",
        style: TextStyle(
          fontSize: Styles.getFontSizeCoffee(appState.size),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: Styles.getFont(darkState.darkTheme),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        height: 140,
        child: Row(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  ButtonTheme(
                    height: 70,
                    minWidth: 80,
                    child: RaisedButton(
                      child: Icon(
                          Ionicons.ios_cafe,
                        size: 37,
                      ),
                        onPressed: (){

                        }
                    ),
                  ),
                  Text(
                    "Espresso",
                    style: TextStyle(
                      fontSize: Styles.getFontSizeCoffee(appState.size),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: Styles.getFont(darkState.darkTheme),
                    ),
                  ),
                  Text(
                    "\$ 1.99",
                    style: TextStyle(
                      fontSize: Styles.getFontSizeCoffee(appState.size),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: Styles.getFont(darkState.darkTheme),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  ButtonTheme(
                    height: 70,
                    minWidth: 80,
                    child: RaisedButton(
                        child: Icon(
                            MaterialIcons.local_cafe,
                          size: 37,
                        ),
                        onPressed: (){

                        },
                    ),
                  ),
                  Text(
                    "Cappuccino",
                    style: TextStyle(
                      fontSize: Styles.getFontSizeCoffee(appState.size),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: Styles.getFont(darkState.darkTheme),
                    ),
                  ),
                  Text(
                    "\$ 2.99",
                    style: TextStyle(
                      fontSize: Styles.getFontSizeCoffee(appState.size),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: Styles.getFont(darkState.darkTheme),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  ButtonTheme(
                    height: 70,
                    minWidth: 80,
                    child: RaisedButton(
                        child: Icon(
                            FontAwesome5Solid.coffee,
                          size: 37,
                        ),
                        onPressed: (){

                        }
                    ),
                  ),
                  Text(
                    "Americano",
                    style: TextStyle(
                      fontSize: Styles.getFontSizeCoffee(appState.size),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: Styles.getFont(darkState.darkTheme),
                    ),
                  ),
                  Text(
                    "\$ 3.99",
                    style: TextStyle(
                      fontSize: Styles.getFontSizeCoffee(appState.size),
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.bold,
                      color: Styles.getFont(darkState.darkTheme),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
      actions: [
        backButton(context),
      ],
    );
  }
}
