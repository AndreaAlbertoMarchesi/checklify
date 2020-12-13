import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/ColorPicker.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorPickerComponent extends StatelessWidget {
  ColorPickerComponent(this.taskValues);
  final TaskValues taskValues;
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
    child: ColorPicker(taskValues),
        decoration: BoxDecoration(
            border: Border(
            bottom: BorderSide(color: settings.getColor()),
            )
        )
    );
  }

}
