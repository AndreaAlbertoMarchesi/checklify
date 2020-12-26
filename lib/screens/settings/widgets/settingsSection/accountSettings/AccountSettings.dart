import 'package:checklist_app/screens/settings/widgets/settingsSection/accountSettings/widget/Avatar.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/accountSettings/widget/NameTag.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextDecoration("Account",
                  fontSize: settings.getFontSizeChildren(),
                  fontStyle: FontStyle.italic,
                  color: settings.getFont()),
            ),
            Avatar(),
            NameTag()
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: settings.getColor()),
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
