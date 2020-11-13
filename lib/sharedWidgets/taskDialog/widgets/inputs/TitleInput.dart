import 'package:checklist_app/states/DarkThemeState.dart';
import 'package:checklist_app/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleInput extends StatelessWidget {
  TitleInput(this.title, this.isAdding, this.setTitle);

  final Function setTitle;
  final String title;
  final bool isAdding;


  @override
  Widget build(BuildContext context) {
    final darkState = context.watch<DarkThemeState>();
    final TextEditingController _controller = new TextEditingController(
      text: isAdding ? '' : title,
    );

    return TextFormField(
      controller: _controller,
      maxLength: 15,
      decoration: InputDecoration(
        hintText: isAdding ? "insert task name" : title,
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
        setTitle(val);
      },
    );
  }
}
