import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTextDecoration extends StatelessWidget {
  AppTextDecoration(this.text,
      {this.fontWeight,
      this.letterSpacing,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.align});

  final String text;
  final double letterSpacing;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final FontStyle fontStyle;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Text(
      text,
      textAlign: align == null ? TextAlign.start : align,
      style: TextStyle(
          letterSpacing: letterSpacing == null ? 0.6 : letterSpacing,
          fontWeight: fontWeight == null ? FontWeight.bold : fontWeight,
          fontSize: fontSize,
          color: color == null? settings.getSideMenu(): color ,
          fontStyle: fontStyle == null ? FontStyle.normal : fontStyle),
    );
  }
}
