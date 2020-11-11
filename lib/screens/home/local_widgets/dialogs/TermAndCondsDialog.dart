import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
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
            fontSize: Styles.getFontSizeChildren(appState.size),
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
            if(appState.appUser.vibrate)
              Vibration.vibrate(duration: 80);
          }
        },
      );
    }

    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Container(
        width: 400.0,
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
                  onChanged: (value){
                    setState(() {
                      _value = !_value;
                    });
                  }
              ),
              Text(
                "Accept Terms & Conditions",
                style: TextStyle(
                  fontSize: Styles.getFontSizeChildren(appState.size)-2,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  color: Styles.getFont(darkState.darkTheme),
                ),
              ),
            ],
          )
        ),
      ),
      actions: [
        acceptButton(context),
      ],
    );
  }
}
