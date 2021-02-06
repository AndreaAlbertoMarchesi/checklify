import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/screens/settings/widgets/AppSwitchListTile.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/AssistanceSettings.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/GeneralSettings.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/accountSettings/widget/Avatar.dart';
import 'package:checklist_app/screens/settings/widgets/settingsSection/accountSettings/widget/NameTag.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  PhoneStorage _phoneStorage;

  await SharedPreferences.getInstance()
      .then((sharedPref) {
        _phoneStorage = PhoneStorage(sharedPref);
      });

  Widget wrap(Widget toWrap) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState(_phoneStorage)),
        ChangeNotifierProvider(create: (_) => Settings(_phoneStorage)),
      ],
      child: MaterialApp(
        home: toWrap,
      )
  );



  testWidgets('Name tag', (WidgetTester tester) async {
    await tester.pumpWidget(
        wrap(NameTag())
    );

    expect(find.byIcon(Icons.create_outlined), findsOneWidget);



    var button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text("Rename"), findsOneWidget);

    var textField= find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, "Mike");
    expect(find.text("Mike"), findsNWidgets(2));

    ///this one or the other in case you don't want to rename it
    /*var returnButton = find.text("Back");
    expect(returnButton, findsOneWidget);
    await tester.tap(returnButton);
    await tester.pumpAndSettle();
    expect(find.text("Anonymous"), findsOneWidget);*/

    var renameButton = find.text("Rename");
    expect(renameButton, findsOneWidget);
    await tester.tap(renameButton);
    await tester.pumpAndSettle();
    expect(find.text("Mike"), findsOneWidget);

  });

  testWidgets('Avatar', (WidgetTester tester) async {
    await tester.pumpWidget(
        wrap(Scaffold(
            body: Avatar()))
    );

    expect(find.byIcon(Icons.auto_awesome), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
  });


  testWidgets('General Settings', (WidgetTester tester) async {
    await tester.pumpWidget(
        wrap(Scaffold(body:GeneralSettings()))
    );

    expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
    expect(find.byIcon(Icons.text_fields_rounded), findsOneWidget);
    expect(find.byIcon(Icons.fullscreen), findsOneWidget);
    expect(find.byIcon(Icons.vibration_rounded), findsOneWidget);

    expect(find.byType(AppSwitchListTile), findsNWidgets(3));

    var button = find.byIcon(Icons.more_vert);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text("Small"), findsOneWidget);
    expect(find.text("Medium"), findsOneWidget);
    expect(find.text("Big"), findsOneWidget);



  });

  testWidgets('Assistance Settings', (WidgetTester tester) async {
    await tester.pumpWidget(
        wrap(Scaffold(
            body: AssistanceSettings()))
    );

    expect(find.byIcon(Icons.bug_report), findsOneWidget);
    expect(find.text("Report a bug"), findsOneWidget);
    expect(find.text("Write an email to notify a bug"), findsOneWidget);
  });



}
