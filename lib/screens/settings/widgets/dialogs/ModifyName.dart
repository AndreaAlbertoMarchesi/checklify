import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class ModifyName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final settings = context.watch<Settings>();
    String userName = '';

    Widget doneButton(context) {
      return FlatButton(
        child: AppTextDecoration("Back",
            fontSize: settings.getFontSizeChildren(),
            fontWeight: FontWeight.bold,
            color: settings.getFont()),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    Widget addButton(context) {
      return FlatButton(
        child: AppTextDecoration("Rename",
            fontSize: settings.getFontSizeChildren(),
            fontWeight: FontWeight.bold,
            color: settings.getFont()),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            settings.modifyName(userName);
            Navigator.of(context).pop();
          } else {
            if (settings.vibrate) Vibration.vibrate(duration: 80);
          }
        },
      );
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      scrollable: true,
      title: Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "User Name",
            filled: true,
            contentPadding: EdgeInsets.all(12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
            ),
          ),
          validator: (val) => (val.isEmpty | (val.length > 10))
              ? 'Enter a valid name ( not too long )'
              : null,
          onChanged: (val) {
            userName = val;
          },
        ),
      ),
      actions: [
        doneButton(context),
        addButton(context),
      ],
    );
  }
}
