import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiplierButton extends StatelessWidget {
  MultiplierButton(this.multiplier, this.updatePrice);

  final num multiplier;
  final Function updatePrice;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: FloatingActionButton(
        child: AppTextDecoration("x" + multiplier.toString(),
            fontSize: settings.getFontSizeChildren()),
        onPressed: () {
          if (multiplier == 1)
            updatePrice(1.99);
          else if (multiplier == 2)
            updatePrice(3.99);
          else
            updatePrice(5.99);
        },
        backgroundColor: settings.getColor(),
      ),
    );
  }
}
