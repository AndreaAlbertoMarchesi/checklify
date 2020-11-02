import 'package:checklist_app/model/AppState.dart';
import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/Settings/Styles.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';


class ModifyName extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();
    String userName = '';

    Widget doneButton(context) {
      return FlatButton(
        child: Text(
          "Back",
          style: TextStyle(
            fontSize: 16,
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

    Widget addButton(context) {
      return FlatButton(
        child: Text(
          "Rename",
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: Styles.getFont(darkState.darkTheme),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            appState.modifyName(userName);
            Navigator.of(context).pop();
          } else {
            Vibration.vibrate(duration: 100);
          }
        },
      );
    }

    return AlertDialog(
      title: Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "User Name",
            filled: true,
            contentPadding: EdgeInsets.all(12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Styles.getBorder(darkState.darkTheme), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Styles.getBorder(darkState.darkTheme), width: 2.0),
            ),
          ),
          validator: (val) => (val.isEmpty | (val.length > 8)) ? 'Enter a valid name ( not too long )' : null,
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
