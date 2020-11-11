import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class TitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    return Form(
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
    );*/
  }
}
