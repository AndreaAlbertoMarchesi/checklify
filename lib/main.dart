import 'file:///C:/Users/Ilaria/AndroidStudioProjects/checklify/lib/controller/SharedPreferences.dart';
import 'package:checklist_app/view/home/AppStateProvider.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final AppPreferences _appPreferences = AppPreferences();

  await _appPreferences.getPreferences();

  runApp(AppStateProvider(_appPreferences));
}
