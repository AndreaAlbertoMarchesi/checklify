import 'package:checklist_app/sharedWidgets/DialogButton.dart';
import 'package:flutter/cupertino.dart';


class AddConfirmButton extends StatelessWidget {
  AddConfirmButton(this.onPressed);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogButton(
      context: context,
      onPressed: onPressed,
      text: 'add',
    );
  }
}
