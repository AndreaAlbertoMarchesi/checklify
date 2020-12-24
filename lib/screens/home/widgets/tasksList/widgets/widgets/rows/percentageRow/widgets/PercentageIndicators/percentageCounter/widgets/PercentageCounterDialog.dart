import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageCounterDialog extends StatefulWidget {
  PercentageCounterDialog(this.task);

  final Task task;

  @override
  _PercentageCounterDialogState createState() =>
      _PercentageCounterDialogState();
}

class _PercentageCounterDialogState extends State<PercentageCounterDialog> {
  int completionCount;

  @override
  void initState() {
    super.initState();
    completionCount = (widget.task.percentage * widget.task.counterMax).round();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Container(
      alignment: Alignment.center,
      height: 75,
      width: 200,
      decoration: BoxDecoration(
        color: Color.fromRGBO(115, 206, 255, 0.20),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                if (completionCount < widget.task.counterMax) completionCount++;
              });
              appState.updatePercentage(
                  widget.task, completionCount / widget.task.counterMax);
            },
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: settings.getAppBarIcon(),
            ),
          ),
        ),
        Expanded(
          child: AppTextDecoration(
              completionCount.toString() +
                  "/" +
                  widget.task.counterMax.toString(),
              align: TextAlign.center,
              fontWeight: FontWeight.bold,
              color: settings.getAppBarIcon(),
              fontSize: settings.getFontSizeChildren()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                if (completionCount > 0) completionCount--;
              });
              appState.updatePercentage(
                  widget.task, completionCount / widget.task.counterMax);
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: settings.getAppBarIcon(),
            ),
          ),
        )
      ]),
    );

/*
    return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Set progress"),
      content: Row(children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (completionCount < widget.task.counterMax) completionCount++;
            });
          },
          icon: Icon(Icons.keyboard_arrow_up),
        ),
        Expanded(
          child: Text(
            completionCount.toString() +
                "/" +
                widget.task.counterMax.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (completionCount > 0) completionCount--;
            });
          },
          icon: Icon(Icons.keyboard_arrow_down),
        )
      ]),
      actions: [
        DialogButton(
          context: context,
          text: "Cancel",
          onPressed: () => Navigator.of(context).pop(),
        ),
        DialogButton(
          context: context,
          text: "Done",
          onPressed: () {
            appState.updatePercentage(
                widget.task, completionCount / widget.task.counterMax);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
*/
  }
}
