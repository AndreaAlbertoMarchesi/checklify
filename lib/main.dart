import 'package:checklist_app/view/Settings/SharedPreferences.dart';
import 'package:checklist_app/view/home/AppStateProvider.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final AppPreferences _appPreferences = AppPreferences();

  await _appPreferences.getPreferences();

  runApp(AppStateProvider(_appPreferences));
}
