import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineFreeDays extends StatelessWidget {
  TimelineFreeDays(this.prevDeadline, this.currentDeadline);

  final DateTime prevDeadline;
  final DateTime currentDeadline;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final Duration durationFromLastDeadline =
        currentDeadline.difference(prevDeadline);
    final Duration durationFromNow = currentDeadline.difference(DateTime.now());

    print(currentDeadline);
    print(prevDeadline);

    return Container(
      color: Colors.grey,
      height: 10 * durationFromLastDeadline.inDays.toDouble(),
      child: ListTile(
        title: Text(durationFromLastDeadline.inDays.toString()),
        subtitle: Text(durationFromNow.inDays.toString()),
      ),
    );
  }
}
