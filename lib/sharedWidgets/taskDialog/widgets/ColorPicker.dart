import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorPicker extends StatelessWidget {
  ColorPicker(this.setColorValue, this.selectedColor);

  final Function setColorValue;

  final Color selectedColor;

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
              colors: materialColors,
              onMainColorChange: (Color color) {
                setColorValue(color);
                Navigator.pop(context);
              },
              selectedColor: selectedColor,
            ),
        );
      },
    );
  }
}
