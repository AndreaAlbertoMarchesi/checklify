import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/inputs/progressTypeInput/ProgressTypeInput.dart';
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


  testWidgets('Indicator type input', (WidgetTester tester) async {

    TaskValues tv = new TaskValues();

    await tester.pumpWidget(
        wrap(Scaffold(body:ProgressTypeInput(tv,test)))
    );

    var button = find.text("CheckBox");
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();


    expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
    var counter = find.text("Counter");
    expect(counter, findsNWidgets(2));
    var cn = counter.hitTestable();
    expect(cn, findsOneWidget);

    var slider = find.text("Slider");
    expect(find.text("Slider"), findsNWidgets(2));
    var sl = slider.hitTestable();
    expect(sl, findsOneWidget);

  });
}
