import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/screens/timeline/InAppCalendar/InAppCalendar.dart';
import 'package:checklist_app/screens/timeline/widgets/TimelineFreeDays.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checklist_app/screens/timeline/Timeline.dart';

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



  testWidgets('Timeline free days item', (WidgetTester tester) async {
    DateTime pre = DateTime.now();
    DateTime post = DateTime.now();

    await tester.pumpWidget(
        wrap(Scaffold(body:TimelineFreeDays(pre, post)))
    );

    expect(find.byType(AppTextDecoration), findsNWidgets(2));


  });

  testWidgets('Timeline app bar', (WidgetTester tester) async {

    await tester.pumpWidget(
        wrap(Scaffold(body:Timeline()))
    );

    var button = find.byIcon(Icons.calendar_today_outlined);
    expect(button, findsOneWidget);
    expect(find.text("TimeLine"), findsOneWidget);


    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(InAppCalendar), findsOneWidget);


  });
}
