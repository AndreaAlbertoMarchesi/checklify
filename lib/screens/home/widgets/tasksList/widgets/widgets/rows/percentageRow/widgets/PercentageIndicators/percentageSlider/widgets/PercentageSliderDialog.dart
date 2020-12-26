import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PercentageSliderDialog extends StatefulWidget {
  PercentageSliderDialog(this.task);

  final Task task;

  @override
  _PercentageSliderDialogState createState() => _PercentageSliderDialogState();
}

class _PercentageSliderDialogState extends State<PercentageSliderDialog> {
  double percentage;

  @override
  void initState() {
    super.initState();
    percentage = widget.task.percentage.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final settings = context.watch<Settings>();

    return Container(
      alignment: Alignment.center,
      height: 90,
      width: 200,
      decoration: BoxDecoration(
        color: Color.fromRGBO(115, 206, 255, 0.20),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          child: AppTextDecoration((percentage * 100).round().toString() + "%",
              color: settings.getAppBarIcon(),
              fontSize: settings.getFontSizeChildren()),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 3),
          child: Slider(
            value: percentage,
            divisions: widget.task.sliderDivisions != null
                ? widget.task.sliderDivisions
                : 3,
            onChanged: (double value) {
              setState(() {
                percentage = value;
              });
              appState.updatePercentage(widget.task, percentage);
            },
          ),
        ),
      ]),
    );

    /*return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Set progress"),
      content: Container(
        alignment: Alignment.center,
        height: 75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
          Text((percentage*100).round().toString()+"%"),
          Slider(
            value: percentage,
            divisions: 100,
            onChanged: (double value) {
              setState(() {
                percentage = value;
              });
            },
          ),
        ]),
      ),
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
            appState.updatePercentage(widget.task, percentage);
            Navigator.of(context).pop();
          },
        ),
      ],
    );*/
  }
}
