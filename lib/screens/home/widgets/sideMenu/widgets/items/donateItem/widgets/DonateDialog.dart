import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/BuyButton.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/CoffeeText.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/MultiplierButton.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonateDialog extends StatefulWidget {
  @override
  _DonateDialogState createState() => _DonateDialogState();
}

class _DonateDialogState extends State<DonateDialog> {
  num price = 1.99;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    Widget backButton(context) {
      return FlatButton(
        child: AppTextDecoration("Back",
            fontSize: settings.getFontSizeChildren(),
            color: settings.getFont()),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    updatePrice(num newPrice) {
      setState(() {
        price = newPrice;
      });
    }

    return AlertDialog(
      scrollable: true,
      title: CoffeeText("Buy a coffee to the team "),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuyButton(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppTextDecoration((price).toString() + "\$"),
                    ),
                    decoration: BoxDecoration(
                      color: settings.getAppBarIcon(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border(
                          bottom: BorderSide(color: settings.getColor()),
                          top: BorderSide(color: settings.getColor()),
                          left: BorderSide(color: settings.getColor()),
                          right: BorderSide(color: settings.getColor())),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MultiplierButton(1, updatePrice),
                  MultiplierButton(2, updatePrice),
                  MultiplierButton(3, updatePrice)
                ],
              ),
            )
          ],
        ),
      ),
      /*Container(
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
      ),*/
      actions: [
        backButton(context),
      ],
    );
  }
}
