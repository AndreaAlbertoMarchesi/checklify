import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class TermAndCondsDialog extends StatefulWidget {
  @override
  _TermAndCondsDialogState createState() => _TermAndCondsDialogState();
}

class _TermAndCondsDialogState extends State<TermAndCondsDialog> {


  bool _value = false;
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();


    Widget acceptButton(context) {
      return FlatButton(
        child: Text(
          "Accept",
          style: TextStyle(
            fontSize: settings.getFontSizeChildren(),
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: settings.getFont(),
          ),
        ),
        onPressed: () {
          if (_value) {
            settings.acceptTermsConditions();
            Navigator.of(context).pop();
          } else {
            if(settings.vibrate)
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
                  fontSize: settings.getFontSizeChildren()-2,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                  color: settings.getFont(),
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
