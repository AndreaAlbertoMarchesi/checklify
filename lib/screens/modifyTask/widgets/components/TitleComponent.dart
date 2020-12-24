import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/TitleInput.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleComponent extends StatelessWidget {
  TitleComponent(this.taskValues, this.isAdding, this.titleFormKey);

  final TaskValues taskValues;
  final bool isAdding;
  final GlobalKey<FormState> titleFormKey;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 6, 6),
              child: AppTextDecoration("Title",
                  fontSize: settings.getFontSizeChildren(),
                  fontWeight: FontWeight.bold,
                  color: settings.getFont()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: titleFormKey, child: TitleInput(taskValues, isAdding)),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: settings.getColor()),
          bottom: BorderSide(color: settings.getColor()),
        )));
  }
}
