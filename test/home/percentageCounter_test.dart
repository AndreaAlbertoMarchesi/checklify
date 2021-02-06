import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/rows/percentageRow/widgets/PercentageIndicators/percentageCounter/PercentageCounter.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
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


  testWidgets('Counter', (WidgetTester tester) async {

    Task task = Task("a",progressType: ProgressType.counter,percentageDivisions: 3);

    await tester.pumpWidget(
        wrap(Scaffold(body: PercentageCounter(task)))
    );

    var counter = find.byType(AppTextDecoration);
    expect(counter, findsOneWidget);

    await tester.tap(counter);
    await tester.pumpAndSettle();

    var up = find.byIcon(Icons.keyboard_arrow_up);
    expect(up, findsOneWidget);
    var down = find.byIcon(Icons.keyboard_arrow_down);
    expect(down, findsOneWidget);

    await tester.tap(up);
    await tester.pumpAndSettle();

    expect(find.text("1/3"), findsOneWidget);

    await tester.tap(down);
    await tester.pumpAndSettle();

    expect(find.text("0/3"), findsNWidgets(2));

  });
}
