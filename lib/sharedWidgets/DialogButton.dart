import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogButton extends StatelessWidget {
  DialogButton(
      {@required this.context, this.onPressed, @required this.text});

  final BuildContext context;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: Styles.getFontSizeChildren(appState.size),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: Styles.getFont(darkState.darkTheme),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
