import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/DonateDialog.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class DonateItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return ListTile(
      leading: Icon(AntDesign.gift),
      title: AppTextDecoration('Buy me a coffee',
          fontSize: settings.getFontSizeChildren(),
          fontWeight: FontWeight.bold,
          color: settings.getFont()),
      onTap: () {
        Navigator.of(context).pop();
        openAddDialog(context);
      },
    );
  }

  void openAddDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DonateDialog();
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 400),
    );
  }
}
