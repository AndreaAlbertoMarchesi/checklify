import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/home/widgets/buttons/AddButton.dart';
import 'package:checklist_app/screens/modifyTask/ModifyTask.dart';
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
      )
  );


  testWidgets('Add button', (WidgetTester tester) async {

    await tester.pumpWidget(
        wrap(Scaffold(body:AddButton()))
    );


    var button = find.byIcon(Icons.add);
    expect(button, findsNWidgets(2));

    expect((tester.firstWidget(find.byType(FloatingActionButton)) as FloatingActionButton).backgroundColor, Colors.greenAccent[700]);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(ModifyTask), findsOneWidget);

    var goBack = find.byIcon(Icons.arrow_back_outlined);

    await tester.tap(goBack);
    await tester.pumpAndSettle();

    var b = find.byIcon(Icons.add);
    expect(b, findsNWidgets(2));

  });
}
