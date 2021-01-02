import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';


class BuyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final settings = context.watch<Settings>();
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Icon(MaterialIcons.local_cafe,size: 37),
            AppTextDecoration("Buy")
          ],
        ),
      ),
      onPressed: (){},
      color: settings.getColor(),
      elevation: 3,
    );
  }
}
