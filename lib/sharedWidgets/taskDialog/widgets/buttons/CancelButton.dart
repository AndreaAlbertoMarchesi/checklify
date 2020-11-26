import 'package:checklist_app/sharedWidgets/DialogButton.dart';
import 'package:flutter/cupertino.dart';


class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogButton(
      context: context,
      onPressed: () => Navigator.pop(context),
      text: 'cancel',
    );
  }
}
