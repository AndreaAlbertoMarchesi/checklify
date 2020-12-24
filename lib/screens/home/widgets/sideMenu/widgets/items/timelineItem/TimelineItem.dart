import 'package:checklist_app/screens/timeline/Timeline.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return ListTile(
      leading: Icon(Icons.calendar_today),
      title: AppTextDecoration('Timeline',
          fontSize: settings.getFontSizeChildren(),
          fontWeight: FontWeight.bold,
          color: settings.getFont()),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Timeline()));
      },
    );
  }
}
