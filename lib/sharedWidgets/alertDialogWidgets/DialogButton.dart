import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogButton extends StatelessWidget {
  DialogButton({@required this.context, this.onPressed, @required this.text});

  final BuildContext context;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: settings.getFont(),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
