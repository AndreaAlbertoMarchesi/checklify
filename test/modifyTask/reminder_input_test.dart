import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/models/supportClasses/TaskValues.dart';
import 'package:checklist_app/screens/modifyTask/widgets/deadlineInput/widgets/DeadlineInputDialog.dart';
import 'package:checklist_app/screens/modifyTask/widgets/reminderInput/ReminderInput.dart';
import 'package:checklist_app/screens/modifyTask/widgets/reminderInput/widgets/ReminderInputDialog.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  PhoneStorage _phoneStorage;
  bool done= false;

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


  test(){
    done = true;
    print("done");
  }

  testWidgets('Reminder input', (WidgetTester tester) async {

    TaskValues tv = new TaskValues();

    await tester.pumpWidget(
        wrap(Scaffold(body:ReminderInput(tv,test)))
    );

    expect(find.text("Reminder"), findsOneWidget);
    var button = find.text("add a reminder...");
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(ReminderInputDialog), findsOneWidget);
    var doneButton = find.text("Done");
    expect(doneButton, findsOneWidget);

    await tester.tap(doneButton);
    await tester.pumpAndSettle();

    expect(find.text("Reminder"), findsOneWidget);
    expect(button, findsOneWidget);
    expect(done, true);

  });

}
