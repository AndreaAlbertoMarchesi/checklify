import 'dart:convert';
import 'dart:io';

import 'package:checklist_app/models/AppUser.dart';
import 'package:checklist_app/models/Task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneStorage {
  PhoneStorage(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  void setValue(String key, value) {
    switch (value.runtimeType) {
      case String:
        sharedPreferences.setString(key, value);
        break;
      case bool:
        sharedPreferences.setBool(key, value);
        break;
      case int:
        sharedPreferences.setInt(key, value);
        break;
      case double:
        sharedPreferences.setDouble(key, value);
        break;
      default:
        print("ERROR invalid sharedPreferences type");
    }
  }

  getValue(String key, defaultValue) => sharedPreferences.containsKey(key)
      ? sharedPreferences.get(key)
      : defaultValue;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    File file = File('$path/counter.txt');
    return file;
  }

  Future<Task> readData() async {
    try {
      final file = await _localFile;
      if (file.existsSync()) {
        String content = await file.readAsString();
        return Task.fromJson(jsonDecode(content));
      }
    } catch (e) {
      print(e);
    }
    return Task.emptyRoot;
  }

  Future<File> writeData(Task root) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(root.toJson()));
  }

  readUser(String key, defaultValue) {
    if (sharedPreferences.containsKey(key)) {
      return AppUser.fromJson(jsonDecode(sharedPreferences.getString(key)));
    } else {
      return defaultValue;
    }
  }

  writeUser(String key, AppUser user) {
    sharedPreferences.setString(key, jsonEncode(user));
  }
}
