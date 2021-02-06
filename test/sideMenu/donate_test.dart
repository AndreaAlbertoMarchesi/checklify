import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/DonateDialog.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/donateItem/widgets/MultiplierButton.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  PhoneStorage _phoneStorage;

  await SharedPreferences.getInstance().then((sharedPref) {
    _phoneStorage = PhoneStorage(sharedPref);
  });

  Widget wrap(Widget toWrap) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppState(_phoneStorage)),
            ChangeNotifierProvider(create: (_) => Settings(_phoneStorage)),
          ],
          child: MaterialApp(
            home: toWrap,
          ));


  testWidgets('Coffee Dialog', (WidgetTester tester) async {
    await tester.pumpWidget(
        wrap(DonateDialog())
    );

    expect(find.byIcon(MaterialIcons.local_cafe), findsOneWidget);
    var returnButton = find.text("Back");
    expect(returnButton, findsOneWidget);


    var button = find.byType(MultiplierButton);
    expect(button, findsNWidgets(3));
    var multiplierX1 = find.text("x1");

    await tester.tap(multiplierX1);
    await tester.pumpAndSettle();
    expect(find.text("espresso"), findsOneWidget);
    expect(find.text("1.99\$"), findsOneWidget);

    var multiplierX2 = find.text("x2");

    await tester.tap(multiplierX2);
    await tester.pumpAndSettle();
    expect(find.text("cappuccino"), findsOneWidget);
    expect(find.text("3.99\$"), findsOneWidget);

    var multiplierX3 = find.text("x3");

    await tester.tap(multiplierX3);
    await tester.pumpAndSettle();
    expect(find.text("americano"), findsOneWidget);
    expect(find.text("5.99\$"), findsOneWidget);


  });
}
