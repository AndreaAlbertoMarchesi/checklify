import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker(this.taskValues);

  final TaskValues taskValues;

  @override
  _ColorPickerState createState() =>
      _ColorPickerState(Color(taskValues.colorValue));
}

class _ColorPickerState extends State<ColorPicker> {
  _ColorPickerState(this.selectedColor);

  Color selectedColor;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Row(children: [
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          "Color",
          style: TextStyle(
            fontSize: settings.getFontSizeChildren(),
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: settings.getFont(),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: InkWell(
          child: Stack(
            children: [
              Positioned(
                left: 2.0,
                top: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: CircleColor(
                    color: Colors.black45,
                    circleSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: CircleColor(
                  color: selectedColor,
                  circleSize: 30,
                ),
              ),
            ],
          ),
          onTap: () => openColorDialog(context, settings),
        ),
      )
    ]);
  }

  void openColorDialog(BuildContext context, Settings settings) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          height: 200,
          width: 200,
          child: MaterialColorPicker(
            shrinkWrap: true,
            allowShades: false,
            spacing: 30,
            colors: settings.getPossibleColors(),
            onMainColorChange: (Color color) {
              widget.taskValues.colorValue = color.value;
              setState(() {
                selectedColor = color;
              });
              Navigator.pop(context);
            },
            selectedColor: selectedColor,
          ),
        );
      },
    );
  }
}
