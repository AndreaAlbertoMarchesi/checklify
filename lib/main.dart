import 'package:checklist_app/screens/Providers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Services/phoneStorage/PhoneStorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance()
      .then((sharedPref) => runApp(Providers(PhoneStorage(sharedPref))));
}
