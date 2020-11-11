import 'package:checklist_app/screens/AppStateProvider.dart';
import 'package:checklist_app/utils/SharedPreferences.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppPreferences _appPreferences = AppPreferences();

  await _appPreferences.getPreferences();

  runApp(AppStateProvider(_appPreferences));
}
