import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/progressTypeInput/widgets/sliderSetter/widgets/SliderSetterDialog.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderSetter extends StatelessWidget {
  SliderSetter(this.taskValues, this.refreshModifyTask);

  final Function refreshModifyTask;
  final TaskValues taskValues;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    Future _showIntDialogSlider() async {
      await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new SliderSetterDialog(taskValues);
        },
      ).then((num value) {
        if (value != null) {
          taskValues.sliderDivisions = value;
          refreshModifyTask();
        }
      });
    }

    return Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
        child: IconButton(
          onPressed: () => _showIntDialogSlider(),
          icon: Icon(Icons.format_list_numbered_rtl),
        ),
      ),
      Text(taskValues.sliderDivisions == null
          ? 3.toString()
          : taskValues.sliderDivisions.toString()),
    ]);
  }
}
