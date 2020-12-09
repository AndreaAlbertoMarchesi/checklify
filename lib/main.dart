import 'package:checklist_app/screens/Providers.dart';
import 'package:checklist_app/utils/PhoneStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance()
      .then((sharedPref) => runApp(Providers(PhoneStorage(sharedPref))));
}
