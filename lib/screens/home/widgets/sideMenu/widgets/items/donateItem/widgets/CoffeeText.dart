import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeText extends StatelessWidget {
  CoffeeText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return AppTextDecoration(text,
        fontSize: settings.getFontSizeCoffee(),
        color: settings.getFont());
  }
}
