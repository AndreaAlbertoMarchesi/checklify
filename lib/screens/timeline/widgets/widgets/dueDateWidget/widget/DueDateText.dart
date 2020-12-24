import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DueDateText extends StatelessWidget {
  DueDateText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Text(
      text,
      style: TextStyle(
        fontSize: settings.getFontSizeCoffee() - 4,
        letterSpacing: 0.5,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        color: settings.getFont(),
      ),
    );
  }
}
