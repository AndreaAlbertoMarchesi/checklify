import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogButton.dart';
import 'package:checklist_app/sharedWidgets/alertDialogWidgets/DialogTitle.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CounterSetterDialog extends StatefulWidget {
  CounterSetterDialog(this.refreshModifyTask, this.taskValues);

  final Function refreshModifyTask;
  final TaskValues taskValues;

  @override
  _CounterSetterDialogState createState() => _CounterSetterDialogState();
}

class _CounterSetterDialogState extends State<CounterSetterDialog> {
  int counter;

  @override
  void initState() {
    counter=widget.taskValues.counterMax;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return AlertDialog(
      shape: settings.getDialogShape(),
      title: DialogTitle("Set Counter:"),
      content: Row(children: [
        IconButton(
          onPressed: () {
           setState(() {
             counter++;
           });
          },
          icon: Icon(Icons.keyboard_arrow_up,),
        ),
        Expanded(
          child: Text(
            counter.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: settings.getFontSizeChildren(),
              letterSpacing: 0.6,
              color: settings.getFont(),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            if(counter>1){
              setState(() {
                counter--;
              });
            }
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
            widget.taskValues.counterMax= counter;
            widget.refreshModifyTask();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
