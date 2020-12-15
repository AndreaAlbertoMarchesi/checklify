import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SelectionListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
      child: Container(
        child: Text(
            "Selected Tasks:",
          style: TextStyle(
            fontSize: settings.getFontSizeChildren(),
            letterSpacing: 0.6,
            color: settings.getFont(),
          ),
        ),
      ),
    );
  }
}
