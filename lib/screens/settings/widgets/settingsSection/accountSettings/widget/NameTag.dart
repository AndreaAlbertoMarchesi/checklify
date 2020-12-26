import 'package:checklist_app/screens/settings/widgets/dialogs/ModifyName.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

class NameTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.create_outlined),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextDecoration(settings.appUser.userName,
                      fontSize: settings.getFontSizeChildren(),
                      color: Colors.lightBlue[50]),
                )),
              ],
            ),
          ),
          onPressed: () {
            openAddDialog(context);
          },
        ),
      ),
    );
  }

  void openAddDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ModifyName();
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 400),
    );
  }
}
