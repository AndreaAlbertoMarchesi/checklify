import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/screens/home/widgets/sideMenu/widgets/items/SettingItem.dart';
import 'package:checklist_app/screens/settings/SettingsPage.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
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


  testWidgets('Settings item', (WidgetTester tester) async {
    await tester.pumpWidget(
        wrap(Scaffold(body:SettingItem()))
    );

    expect(find.byIcon(Icons.settings), findsOneWidget);
    var button = find.text("Settings");
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(SettingsPage), findsOneWidget);



  });
}
