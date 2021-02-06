import 'package:checklist_app/Services/phoneStorage/PhoneStorage.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:checklist_app/screens/home/widgets/tasksList/widgets/widgets/dialogs/DeleteDialog.dart';
import 'package:checklist_app/states/AppState.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
      ));


  testWidgets('Delete Dialog', (WidgetTester tester) async {
    await tester.pumpWidget(
        wrap(DeleteDialog(task))
    );

    var returnButton = find.text("No");
    expect(returnButton, findsOneWidget);

    var confirmButton = find.text("Yes");
    expect(confirmButton, findsOneWidget);

    expect(find.text("Item Selected"), findsOneWidget);
    expect(find.text("Do you want to delete it?"), findsOneWidget);

    expect(find.byType(FlatButton), findsNWidgets(2));


  });
}
