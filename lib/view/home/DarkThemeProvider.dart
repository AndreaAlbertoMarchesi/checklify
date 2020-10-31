import 'package:checklist_app/model/DarkThemeState.dart';
import 'package:checklist_app/view/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DarkThemeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DarkThemeState(),
        child: Home());
  }
}