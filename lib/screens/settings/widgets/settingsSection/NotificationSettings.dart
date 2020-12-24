import 'package:checklist_app/screens/settings/widgets/AppSwitchListTile.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    _setNotification(notifications) {
      settings.setNotification(notifications);
    }

    return Container(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextDecoration("Notifications",
                    fontSize: settings.getFontSizeChildren(),
                    fontStyle: FontStyle.italic,
                    color: settings.getFont())),
            AppSwitchListTile(
                title: "Notifications",
                icon: Icons.notifications_active_outlined,
                value: settings.notifications,
                function: _setNotification),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: settings.getColor()),
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
