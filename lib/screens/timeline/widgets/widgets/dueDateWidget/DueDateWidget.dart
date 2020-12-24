import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/timeline/widgets/widgets/dueDateWidget/widget/DueDateText.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DueDateWidget extends StatelessWidget {
  DueDateWidget(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextDecoration(task.deadline.day.toString(),
                fontSize: settings.getFontSizeCoffee(),
                letterSpacing: 0.5,
                color: settings.getFont()),
            task.deadline.day == 1
                ? DueDateText("st")
                : task.deadline.day == 2
                    ? DueDateText("nd")
                    : task.deadline.day == 3
                        ? DueDateText("rd")
                        : DueDateText("th")
          ],
        ),
      ),
    );
  }
}
