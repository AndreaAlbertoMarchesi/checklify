import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SelectionListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: Container(
        child: AppTextDecoration("Selected Tasks:",
            fontSize: settings.getFontSizeChildren(),
            color: settings.getFont()),
      ),
    );
  }
}
