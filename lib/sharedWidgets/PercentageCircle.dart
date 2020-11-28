import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageCircle extends StatelessWidget {
  PercentageCircle(this.percentage);

  final num percentage;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return (percentage * 100).round() == 100
        ? Icon(
            const IconData(0xe0de, fontFamily: 'MaterialIcons'),
            color: Colors.lightGreen[900],
            size: settings.getFontSizeParent() - 3,
          )
        : Text(
            (percentage * 100).round().toString() + "%",
            style: TextStyle(
              fontSize: settings.getFontPercentageChildren(),
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles(),
            ),
          );
  }
}
