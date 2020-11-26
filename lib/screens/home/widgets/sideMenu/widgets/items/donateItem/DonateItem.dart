import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/DonateDialog.dart';
import 'package:checklist_app/screens/intro/IntroApp.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class DonateItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return ListTile(
      leading: Icon(AntDesign.gift),
      title: Text(
        'Buy me a coffee',
        style: TextStyle(
          fontSize: settings.getFontSizeChildren(),
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
          color: settings.getFont(),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        openAddDialog(context);
      },
    );
  }
  void openAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DonateDialog();
      },
    );
  }
}