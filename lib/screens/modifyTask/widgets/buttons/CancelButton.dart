import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return IconButton(
      icon: Icon(
        Icons.arrow_back_outlined,
        color: settings.getAppBarIcon(),
        size: 30,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
