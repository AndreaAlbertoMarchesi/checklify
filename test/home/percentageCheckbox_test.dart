import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/PercentageIndicators/PercentageCheckbox.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  PhoneStorage _phoneStorage;

  Task task = Task("a");

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


  testWidgets('CheckBox', (WidgetTester tester) async {

    await tester.pumpWidget(
        wrap(Scaffold(body: PercentageCheckbox(task)))
    );

    expect(find.byType(Checkbox), findsOneWidget);
    expect((tester.firstWidget(find.byType(Checkbox)) as Checkbox).activeColor, Colors.greenAccent[700]);

  });
}
