import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker(this.setColor, this.selectedColor);

  final Function setColor;
  final Color selectedColor;

  @override
  _ColorPickerState createState() => _ColorPickerState(selectedColor);
}

class _ColorPickerState extends State<ColorPicker> {
  _ColorPickerState(this.selectedColor);

  Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "color",
      ),
      trailing: CircleColor(
        color: selectedColor,
        circleSize: 30,
      ),
      onTap: () => openColorDialog(context),
    );
  }

  void openColorDialog(BuildContext context) {
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
            colors: accentColors,
            onMainColorChange: (Color color) {
              widget.setColor(color);
              setState(() {
                selectedColor = color;
              });
              Navigator.pop(context);
            },
            selectedColor: widget.selectedColor,
          ),
        );
      },
    );
  }
}
