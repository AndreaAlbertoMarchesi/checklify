import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/Validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleInput extends StatelessWidget {
  TitleInput(this.taskValues, this.isAdding);

  final TaskValues taskValues;
  final bool isAdding;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final TextEditingController _controller = new TextEditingController(
      text: taskValues.title,
    );

    return TextFormField(
      autofocus: false,//isAdding && taskValues.title == "",
      controller: _controller,
      maxLength: 15,
      decoration: InputDecoration(
        hintText: isAdding ? "insert task name" : taskValues.title,
        filled: true,
        contentPadding: EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: settings.getBorder(), width: 2.0),
        ),
      ),
      validator: Validator.validateTitle,
      onChanged: (val) => taskValues.title = val,
    );
  }
}
