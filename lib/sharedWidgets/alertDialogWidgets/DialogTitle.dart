import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DialogTitle extends StatelessWidget {
  DialogTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    return Text(
      text,
      style: TextStyle(
        fontSize: settings.getFontSizeChildren(),
        letterSpacing: 0.6,
        fontWeight: FontWeight.bold,
        color: settings.getFont(),
      ),
    );
  }
}
