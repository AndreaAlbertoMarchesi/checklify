import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return IconButton(
      icon: Icon(
          Icons.notifications_active_outlined,
          color: settings.getFontTiles(),
      ),
      onPressed: () {},
    );
  }
}
