import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistanceSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'smith@example.com',
        queryParameters: {'subject': 'Report a Bug'});

    return Container(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextDecoration("Assistance",
                    fontSize: settings.getFontSizeChildren(),
                    fontStyle: FontStyle.italic,
                    color: settings.getFont())),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: AppTextDecoration("Report a bug",
                  fontSize: settings.getFontSizeChildren()),
              subtitle: AppTextDecoration("Write an email to notify a bug",
                  fontSize: settings.getFontSizeCoffee()),
              onTap: () {
                launch(_emailLaunchUri.toString());
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
