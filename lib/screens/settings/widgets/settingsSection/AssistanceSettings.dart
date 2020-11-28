
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
              child: Text(
                "Assistance",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren(),
                  letterSpacing: 0.6,
                  fontStyle: FontStyle.italic,
                  color: settings.getFont(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: Text(
                "Report a bug",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren(),
                ),
              ),
              subtitle: Text(
                "Write an email to notify a bug",
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren() - 4.0,
                ),
              ),
              onTap: () {
                launch(_emailLaunchUri.toString());
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: settings.getColor()
              ),
              bottom: BorderSide(
                  color: settings.getColor()
              ),
            )
        )
    );
  }
}
