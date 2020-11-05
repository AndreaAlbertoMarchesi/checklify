import 'package:checklist_app/view/home/AppStateProvider.dart';
import 'package:flutter/material.dart';
import 'controller/SharedPreferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final AppPreferences _appPreferences = AppPreferences();

  await _appPreferences.getPreferences();

  runApp(AppStateProvider(_appPreferences));
}
