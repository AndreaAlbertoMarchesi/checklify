import 'package:checklist_app/states/Settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ConfirmButton extends StatelessWidget {
  ConfirmButton(this.onPressed);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return IconButton(
      icon: Icon(
        Icons.check,
        color: settings.getAppBarIcon(),
        size: 30,
      ),
      onPressed: onPressed,
    );
  }
}
