import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StarInput extends StatelessWidget {
  StarInput(this.isStarred, this.setStar);

  final Function setStar;
  final bool isStarred;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return IconButton(
      icon: isStarred
          ? Icon(Icons.star, color: Colors.yellowAccent)
          : Icon(Icons.star_border, color: Colors.yellowAccent),
      onPressed: () => setStar(!isStarred),
    );
  }
}
