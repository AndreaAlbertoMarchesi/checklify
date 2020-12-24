import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/CoffeeText.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class DonateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    Widget backButton(context) {
      return FlatButton(
        child: AppTextDecoration("Back",
            fontSize: settings.getFontSizeChildren(),
            fontWeight: FontWeight.bold,
            color: settings.getFont()),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    return AlertDialog(
      scrollable: true,
      title: CoffeeText("Buy a coffee to the team "),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        height: 140,
        child: Row(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  ButtonTheme(
                    height: 70,
                    minWidth: 80,
                    child: RaisedButton(
                        child: Icon(
                          Ionicons.ios_cafe,
                          size: 37,
                        ),
                        onPressed: () {}),
                  ),
                  CoffeeText("Espresso"),
                  CoffeeText("\$ 1.99")
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  ButtonTheme(
                    height: 70,
                    minWidth: 80,
                    child: RaisedButton(
                      child: Icon(
                        MaterialIcons.local_cafe,
                        size: 37,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CoffeeText("Cappuccino"),
                  CoffeeText("\$ 2.99")
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  ButtonTheme(
                    height: 70,
                    minWidth: 80,
                    child: RaisedButton(
                        child: Icon(
                          FontAwesome5Solid.coffee,
                          size: 37,
                        ),
                        onPressed: () {}),
                  ),
                  CoffeeText("Americano"),
                  CoffeeText("\$ 3.99")
                ],
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
      actions: [
        backButton(context),
      ],
    );
  }
}
