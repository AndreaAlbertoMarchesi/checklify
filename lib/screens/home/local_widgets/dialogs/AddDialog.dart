import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';

class AddDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final appState = context.watch<AppState>();
    final darkState = context.watch<DarkThemeState>();
    String taskName = '';
    Color color = Colors.white;

    Widget doneButton(context) {
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

    Widget addButton(context) {
      return FlatButton(
        child: Text(
          "Add",
          style: TextStyle(
            fontSize: Styles.getFontSizeChildren(appState.size),
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: Styles.getFont(darkState.darkTheme),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            appState.addTask(taskName);
            Navigator.of(context).pop();
          } else {
            if (appState.appUser.vibrate) Vibration.vibrate(duration: 80);
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
            hintText: "Add a Task",
            filled: true,
            contentPadding: EdgeInsets.all(12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Styles.getBorder(darkState.darkTheme), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Styles.getBorder(darkState.darkTheme), width: 2.0),
            ),
          ),
          validator: (val) => (val.isEmpty | (val.length > 15))
              ? 'Enter a valid name ( not too long )'
              : null,
          onChanged: (val) {
            taskName = val;
          },
        ),
      ),
      content: Container(
        width: 100,
        height: 100,
        child: MaterialColorPicker(
          allowShades: false,
          onColorChange: (Color color) {
            // Handle color changes
          },
          selectedColor: Colors.red,
        ),
      ),
      actions: [
        doneButton(context),
        addButton(context),
      ],
    );
  }
}
