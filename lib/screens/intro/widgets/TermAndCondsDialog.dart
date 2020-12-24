import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
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
        child: AppTextDecoration("Accept",
            fontSize: settings.getFontSizeChildren(),
            fontWeight: FontWeight.bold,
            color: settings.getFont()),
        onPressed: () {
          if (_value) {
            settings.acceptTermsConditions();
            Navigator.of(context).pop();
          } else {
            if (settings.vibrate) Vibration.vibrate(duration: 80);
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
                    onChanged: (value) {
                      setState(() {
                        _value = !_value;
                      });
                    }),
                AppTextDecoration("Accept Terms & Conditions",
                    fontSize: settings.getFontSizeChildren() - 2,
                    fontWeight: FontWeight.bold,
                    color: settings.getFont())
              ],
            )),
      ),
      actions: [
        acceptButton(context),
      ],
    );
  }
}
