import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';

class TermAndCondsDialog extends StatefulWidget {
  @override
  _TermAndCondsDialogState createState() => _TermAndCondsDialogState();
}

class _TermAndCondsDialogState extends State<TermAndCondsDialog> {

  bool _value = false;
  @override
  Widget build(BuildContext context) {

    final darkState = context.watch<DarkThemeState>();
    final appState = context.watch<AppState>();


    Widget acceptButton(context) {
      return FlatButton(
        child: Text(
          "Accept",
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: Styles.getFont(darkState.darkTheme),
          ),
        ),
        onPressed: () {
          if (_value) {
            appState.acceptTermsConditions();
            Navigator.of(context).pop();
          } else {
            Vibration.vibrate(duration: 100);
          }
        },
      );
    }

    return AlertDialog(
      title: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                _value = !_value;
              });
            },
            child: Row(
              children: [
                Checkbox(
                    value: _value,
                    onChanged: (value){}
                ),
                Text(
                  "Accept Terms & Conditions",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.bold,
                    color: Styles.getFont(darkState.darkTheme),
                  ),
                ),
              ],
            )
          )),
      actions: [
        acceptButton(context),
      ],
    );
  }
}
