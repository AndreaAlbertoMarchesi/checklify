import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/PercentageIndicators/PercentageCheckbox.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/PercentageIndicators/percentageCounter/PercentageCounter.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/PercentageIndicators/percentageSlider/PercentageSlider.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/Star.dart';
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
          child: Container(
            width: 200,
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text:task.title,
                style: TextStyle(
                  fontSize: settings.getFontSizeChildren(),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: settings.getFontTiles(),
                ),
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
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
