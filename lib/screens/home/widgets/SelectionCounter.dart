import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionCounter extends StatelessWidget {
  SelectionCounter(this.selectionLength);

  final int selectionLength;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: AppTextDecoration(selectionLength.toString(),
                fontSize: settings.getFontSizeChildren(),
                fontWeight: FontWeight.bold,
                color: settings.getFontTiles()),
          ),
        ));
  }
}
