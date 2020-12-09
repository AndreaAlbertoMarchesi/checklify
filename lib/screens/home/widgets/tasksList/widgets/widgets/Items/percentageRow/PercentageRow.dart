import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/percentageRow/widgets/NotificationIcon.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/percentageRow/widgets/PercentageIndicators/PercentageCheckbox.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/percentageRow/widgets/PercentageIndicators/PercentageCounter.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/percentageRow/widgets/PercentageIndicators/PercentageSlider.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/Items/percentageRow/widgets/Star.dart';
import 'package:checklist_app/sharedWidgets/PercentageCircle.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageRow extends StatelessWidget {
  PercentageRow(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final appState = context.watch<AppState>();

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            task.title,
            style: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              color: settings.getFontTiles(),
            ),
          ),
        ),
        Expanded(child: Container()),
        if (task.notification != null &&
            task.notification.dateTime.isAfter(DateTime.now()))
          NotificationIcon(),
        if (task.isStarred) Star(),
        getPercentageIndicator(task),
      ],
    );
  }

  // ignore: missing_return
  Widget getPercentageIndicator(Task task) {
    if (task.children.isNotEmpty)
      return PercentageCircle(task);
    else
      switch (task.progressType) {
        case ProgressType.checkbox:
          return PercentageCheckbox(task);
        case ProgressType.slider:
          return PercentageSlider(task);
        case ProgressType.counter:
          return PercentageCounter(task);
      }
  }
}
