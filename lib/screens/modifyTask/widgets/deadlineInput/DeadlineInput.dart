import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/deadlineInput/widgets/DeadlineInputDialog.dart';
import 'package:checklist_app/screens/modifyTask/widgets/deadlineInput/widgets/DoesShowDailyPercentageInput.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:checklist_app/utils/DateTimeFormatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

class DeadlineInput extends StatelessWidget {
  DeadlineInput(this.taskValues, this.refreshModifyTask);

  final TaskValues taskValues;
  final Function refreshModifyTask;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Container(
        child: Column(children: [
          InkWell(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: AppTextDecoration("Due Date",
                      fontSize: settings.getFontSizeChildren(),
                      color: settings.getFont()),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(2,0,0,0),
                    child: AppTextDecoration(
                        taskValues.deadline != null
                            ? DateTimeFormatter.dateTimeToFullString(
                                taskValues.deadline)
                            : "add deadline...",
                        fontSize: settings.getFontSizeCoffee() - 3,
                        color: settings.getFont())),
              ],
            ),
            onTap: () {
              showAnimatedDialog(
                context: context,
                builder: (context) =>
                    DeadlineInputDialog(taskValues, refreshModifyTask),
                animationType: DialogTransitionType.fade,
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 400),
                barrierDismissible: true,
              );
            },
          ),
          if(taskValues.deadline!=null)
            DoesShowDailyPercentageInput(taskValues, refreshModifyTask),
        ]),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
